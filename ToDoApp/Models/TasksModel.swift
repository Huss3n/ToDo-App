//
//  TasksModel.swift
//  ToDoApp
//
//  Created by Muktar Hussein on 20/11/2022.
//

import Foundation

struct TasksModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
