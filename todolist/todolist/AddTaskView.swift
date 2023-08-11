//
//  AddTaskView.swift
//  todolist
//
//  Created by Lindsey Olson on 8/10/23.
//

import SwiftUI

struct AddTaskView: View {
    @ObservedObject var viewModel = TaskViewModel()
    @State var newTask: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                taskAdder
                Spacer()
                showTasks
            }
            .padding()
            .navigationTitle("Tasks")
        }
    }
    
    private var taskAdder: some View {
        HStack {
            TextField("Add Task", text: $newTask)
            Button(action: {
                viewModel.addNewTask(newTask: newTask)
                newTask = ""
            }, label: {
                Text("Add")
            })
        }
    }
    
    private var showTasks: some View {
        List {
            ForEach(viewModel.tasks) { task in
                Text(task.taskItem)
            }
            .onDelete(perform: self.deleteTask)
        }
    }
        
        func deleteTask(at offsets: IndexSet) {
            viewModel.tasks.remove(atOffsets: offsets)
        }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView(newTask: "")
    }
}
