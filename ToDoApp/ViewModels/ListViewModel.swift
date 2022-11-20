//
//  ListViewModel.swift
//  ToDoApp
//
//  Created by Muktar Hussein on 20/11/2022.
//

import Foundation

class ListViewModel: ObservableObject{
    @Published var items: [TasksModel] = []{
        // this is a computed property
        didSet{
            // called anytime the items array gets edited or anytime it gets affected
            // limits calling the function on all places i.e delete, move item, add item
            saveUseTask()
        }
    }
    let taskKeys: String = "task_keys"
    
    init() {
        getTask()
    }
    
    // func to append data to array
    func getTask(){
        guard let userData = UserDefaults.standard.data(forKey: taskKeys) else {return}
        // covert data from json to swift data
        guard let savedTasks = try? JSONDecoder().decode([TasksModel].self, from: userData) else {return}
        self.items = savedTasks
    }
    func deleteItem(indexset: IndexSet){
        items.remove(atOffsets: indexset)
    }
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    func addnewTask(title: String){
        let newTaask = TasksModel(title: title, isCompleted: false)
        items.append(newTaask)
    }
    func updateTask(item: TasksModel){
        
        // get the index of the item in the array
        //        if let index = items.firstIndex { existingItem in
        //            return existingItem.id == item.id
        //        }{
        //            //
        //        }
        
        if let index = items.firstIndex(where: {$0.id == item.id}){
            items[index] = item.updateCompletedTask()
        }
    }
    
    // saving data in the phone
    // will use user defaults in place of coredata
    func saveUseTask(){
        // convert the tasks to json
        if let encodedData = try? JSONEncoder().encode(items){
            // store it in user defaults
            UserDefaults.standard.set(encodedData, forKey: taskKeys)
        }
    }
}
