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
    @EnvironmentObject var listViewModel: ListViewModel
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
                ForEach(listViewModel.items) { item in
                    Lists(task: item)
                        .onTapGesture {
                            withAnimation(.linear){
                                listViewModel.updateTask(item: item)
                            }
                        }
                }
                .onDelete(perform: listViewModel.deleteItem)
                .onMove(perform:listViewModel.moveItem)
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
        .navigationBarTitleDisplayMode(.inline)
    }
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}
