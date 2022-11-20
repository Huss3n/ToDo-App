//
//  Lists.swift
//  ToDoApp
//
//  Created by Muktar Hussein on 20/11/2022.
//

import SwiftUI

struct Lists: View {
    let task: TasksModel
    var body: some View {
        HStack{
            Image(systemName: task.isCompleted ? "circle" : "checkmark.circle")
                .foregroundColor(task.isCompleted ? .green : .red)
            Text(task.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct Lists_Previews: PreviewProvider {
    static var task1 = TasksModel(title: "First", isCompleted: false)
    static var task2 = TasksModel(title: "second", isCompleted: true)
    
    static var previews: some View {
        Group{
            Lists(task: task1)
            Lists(task: task2)
        }
        .previewLayout(.sizeThatFits)
    }
}
