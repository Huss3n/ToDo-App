//
//  TasksModel.swift
//  ToDoApp
//
//  Created by Muktar Hussein on 20/11/2022.
//

import Foundation

struct TasksModel: Identifiable, Decodable, Encodable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletedTask() -> TasksModel{
        return TasksModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
