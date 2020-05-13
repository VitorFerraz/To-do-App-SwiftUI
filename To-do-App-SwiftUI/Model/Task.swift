//
//  Task.swift
//  To-do-App-SwiftUI
//
//  Created by vitor.ferrazvarela on 13/05/20.
//  Copyright © 2020 Vitor Ferraz Varela. All rights reserved.
//

import Foundation
import FirebaseFirestoreSwift
import FirebaseFirestore

struct Task: Identifiable, Codable {
    @DocumentID var id: String?
    @ServerTimestamp var createdTime: Timestamp?
    var userId: String? 
    var title: String
    var completed: Bool
}

#if DEBUG
var testDataTasks = [
    Task(title: "Teste1", completed: false),
    Task(title: "Vitor", completed: true),
    Task(title: "Profit", completed: true)
]
#endif
