//
//  ToDoAppApp.swift
//  ToDoApp
//
//  Created by Muktar Hussein on 18/11/2022.
//

import SwiftUI

@main
struct ToDoAppApp: App {
    @StateObject  var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
