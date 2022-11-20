//
//  ListView.swift
//  ToDoApp
//
//  Created by Muktar Hussein on 20/11/2022.
//

/*
 mvvm architecture
 model - data point
 view - ui
 viewModel - manages models for views
 */

import SwiftUI

struct ListView: View {
    
    @State var items:[TasksModel] = [
        TasksModel(title: "First title", isCompleted: false),
        TasksModel(title: "Second title", isCompleted: false),
        TasksModel(title: "Third task", isCompleted: true)

    ]
    
    var body: some View {
        VStack{
            HStack {
                Text("To do list 📝")
                    .font(.title).bold()
                    .padding()
                Spacer()
            }
            .padding(.vertical, -10)
            List{
                ForEach(items) { item in
                    Lists(task: item)
                }
            }
        }
        
        .listStyle(.plain)
        .toolbar{
            ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink("Add") {
                    AddTaskView()
                }
            }
        }
        //        .navigationTitle("Todo List 📝")
        .navigationBarTitleDisplayMode(.inline)
        
        
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            ListView()
        }
    }
}
