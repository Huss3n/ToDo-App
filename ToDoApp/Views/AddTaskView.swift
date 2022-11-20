//
//  AddTaskView.swift
//  ToDoApp
//
//  Created by Muktar Hussein on 20/11/2022.
//

import SwiftUI

struct AddTaskView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var  listViewModel: ListViewModel
    @State private var newTask = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
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
                    saveButtonPressed()
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
            .alert(isPresented: $showAlert) {
                displayAlert()
            }
        }
    }
    func saveButtonPressed(){
        if checkTask(){
            listViewModel.addnewTask(title: newTask)
            presentationMode.wrappedValue.dismiss()
        }
    }
    func checkTask() -> Bool{
        if newTask.count < 3{
            alertTitle = "Task needs to be atleast three character long! 😨"
            showAlert.toggle()
            return false
        }
        return true
    }
    func displayAlert() -> Alert{
        return Alert(title: Text(alertTitle))
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            AddTaskView()
        }
        .environmentObject(ListViewModel())
    }
}
