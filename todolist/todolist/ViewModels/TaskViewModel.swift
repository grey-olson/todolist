//
//  TaskViewModel.swift
//  todolist
//
//  Created by Lindsey Olson on 8/10/23.
//

import Foundation

class TaskViewModel: ObservableObject {
    @Published var tasks = [Task]()
    
    func addNewTask(newTask: String) {
        tasks.append(Task(
            taskItem: newTask,
            id: String(tasks.count + 1)
        ))
    }
}
