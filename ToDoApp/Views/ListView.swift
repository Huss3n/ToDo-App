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
            VStack{
                HStack {
                    Text("Todo Categories")
                        .font(.title2)
                        .padding()
                    Spacer()
                }
                .padding()
                HStack(spacing: 45){
                    VStack(spacing: 10){
                        Image(systemName: "book.fill")
                            .font(.system(size: 35))
                            .foregroundColor(.blue)
                            .shadow(color: .gray, radius: 1, x: 0, y: 0)
                        Text("School")
                            .padding(.vertical, 4)
                    }
                    VStack(spacing: 10){
                        Image(systemName: "playstation.logo")
                            .font(.system(size: 35))
                            .foregroundColor(.blue)
                            .shadow(color: .gray, radius: 1, x: 0, y: 0)
                        Text("Holiday")
                            .padding(.vertical, 4)
                    }
                    VStack(spacing: 10){
                        Image(systemName: "dollarsign.square")
                            .font(.system(size: 35))
                            .foregroundColor(.blue)
                            .shadow(color: .gray, radius: 1, x: 0, y: 0)
                        Text("Business")
                            .padding(.vertical, 4)
                    }
                    VStack(spacing: 10){
                        Image(systemName: "bag")
                            .font(.system(size: 35))
                            .foregroundColor(.blue)
                            .shadow(color: .gray, radius: 1, x: 0, y: 0)
                        Text("Shopping")
                            .padding(.vertical, 4)
                    }
                }
                .font(.subheadline)
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
