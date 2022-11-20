//
//  AddTaskView.swift
//  ToDoApp
//
//  Created by Muktar Hussein on 20/11/2022.
//

import SwiftUI

struct AddTaskView: View {
    @State private var newTask = ""
    var body: some View {
        ZStack{
            Color("Background")
                .ignoresSafeArea()
            VStack{
                HStack {
                    Text("Add task 🖊️")
                        .font(.title2).bold()
                        .padding(.vertical,-2)
                        .padding(.horizontal)
                    Spacer()
                }
                .padding()
                    TextField("Add new task", text: $newTask)
                    .padding(.horizontal)
                    .frame(height: 50)
                    .background(Color.gray)
                    .opacity(1)
                    .cornerRadius(10)
                    
                    Button {
                        //
                    } label: {
                        Text("Save")
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 150, height: 40)
                            .background(Color.blue)
                            .clipShape(Capsule())
                    }
                    .padding()
                    Spacer()
            }
            .padding()
        }
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
    }
}
