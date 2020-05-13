//
//  TaskCellViewModel.swift
//  To-do-App-SwiftUI
//
//  Created by vitor.ferrazvarela on 13/05/20.
//  Copyright © 2020 Vitor Ferraz Varela. All rights reserved.
//

import Foundation
import Combine

class TaskCellViewModel: ObservableObject, Identifiable {
    @Published var taskRepository = TaskRepository()
    @Published var task: Task
    var id: String = ""
    @Published var completionStateIconName: String = ""
    private var cancellabled = Set<AnyCancellable>()
    init(task: Task) {
        self.task = task
        $task.map({ task in
            task.completed ? "checkmark.circle.fill" : "circle"
            }).assign(to: \.completionStateIconName, on: self)
            .store(in: &cancellabled)
        
        $task.compactMap({ task in
            task.id
            }).assign(to: \.id, on: self)
            .store(in: &cancellabled)
        
        $task
        .dropFirst()
            .debounce(for: 0.8, scheduler: RunLoop.main)
            .sink { (task) in
            self.taskRepository.updateTask(task)
        }.store(in: &cancellabled)
    }
}
