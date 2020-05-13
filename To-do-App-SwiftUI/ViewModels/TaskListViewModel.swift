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
    @Published var taskCellViewModels = [TaskCellViewModel]()
    private var cancellabled = Set<AnyCancellable>()
    
    init() {
        self.taskCellViewModels = testDataTasks.map({ task in
            TaskCellViewModel(task: task)
        })
    }
    
    func addTask(task: Task) {
        let taskVM = TaskCellViewModel(task: task)
        self.taskCellViewModels.append(taskVM)
    }
}
