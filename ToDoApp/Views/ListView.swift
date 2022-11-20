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
        ZStack{
            Color("Background")
                .ignoresSafeArea()
            if listViewModel.items.isEmpty{
                NoTasksView()
                    .transition(AnyTransition.opacity.animation(.easeInOut))
            }else{
                List{
                    ForEach(listViewModel.items) { item in
                        Lists(task: item).listRowBackground(Color("Background"))
                            .onTapGesture {
                                withAnimation(.linear){
                                    listViewModel.updateTask(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform:listViewModel.moveItem)
                }
                .listStyle(.plain)
            }
        }
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
                .navigationTitle("ToDo List 📝")
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
