//
//  TaskListViewModel.swift
//  To-do-App-SwiftUI
//
//  Created by vitor.ferrazvarela on 13/05/20.
//  Copyright © 2020 Vitor Ferraz Varela. All rights reserved.
//

import Foundation
import Combine

class TaskListViewModel: ObservableObject {
    @Published var taskRepository = TaskRepository()
    @Published var taskCellViewModels = [TaskCellViewModel]()
    private var cancellabled = Set<AnyCancellable>()
    
    init() {
        taskRepository.$tasks.map({ tasks in
            tasks.map({ task in
                TaskCellViewModel(task: task)
            })
        }).assign(to: \.taskCellViewModels, on: self).store(in: &cancellabled)
    }
    
    func addTask(task: Task) {
        taskRepository.addTask(task)
    }
}
