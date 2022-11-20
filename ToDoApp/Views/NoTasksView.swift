//
//  NoTasksView.swift
//  ToDoApp
//
//  Created by Muktar Hussein on 20/11/2022.
//

import SwiftUI

struct NoTasksView: View {
    @State var animate: Bool = false
    var body: some View {
        VStack(spacing:20){
            Text("There are no items!")
                .font(.title)
                .fontWeight(.semibold)
            Text("There are no items in the list 😩.\n Press the add button to add tasks or items to the Todo List. Be the produtive person you want! ")
                .padding(.vertical)
                .padding(.bottom, 10)
            
            NavigationLink("Add task 🥳") {
                AddTaskView()
            }
            .padding(.horizontal, animate ? 10 : 20)
            .foregroundColor(.white)
            .padding()
            .foregroundColor(.white)
            .background(animate ? Color.mint : Color.green)
            .cornerRadius(40)
            .frame(width: 200, height: 10)
            .shadow(color: animate ? Color.red.opacity(0.6) : Color.blue.opacity(0.6),
                    radius: animate ? 30 : 10,
                    x: 0,
                    y: animate ? 50 : 30)
            
            Spacer()
        }
        .multilineTextAlignment(.center)
        .padding(40)
        .onAppear(perform: addAnimation)
    }
    func addAnimation(){
        guard !animate else{return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ){
                animate.toggle()
            }
        }
    }
}

struct NoTasksView_Previews: PreviewProvider {
    static var previews: some View {
        NoTasksView()
    }
}
