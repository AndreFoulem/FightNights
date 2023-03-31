//
//  TasksView.swift
//  FightNights
//
//  Created by AndreMacBook on 2023-03-31.
//

import SwiftUI

struct TasksView: View {
   //-> Expose the managedObjectContext
   @Environment(\.managedObjectContext) var context
   @FetchRequest<TaskEntity>(sortDescriptors: [SortDescriptor(\.done)]) var tasks
   @State private var newTask = false
   
    var body: some View {
      NavigationStack {
        
        List {
          ForEach(tasks) { task in
            
            NavigationLink {
              EditTaskView()
            } label: {
              HStack {
                VStack(alignment: .leading) {
                  Text(task.viewTaskName)
                    .strikethrough(task.done, color: .red)
                  Text(task.viewDueDate)
                    .font(.caption)
                }
                Spacer()
                Image(systemName: task.viewPriority)
                  .font(.title)
                  .foregroundColor(task.viewPriorityColor)
              }
            }//nl
            
          }//for
        }//list
        .navigationTitle("Tasks")
        .toolbar {
          ToolbarItem {
            Button {
              newTask.toggle()
            } label: {
            Image(systemName: "plus")
            }
          }
        }//toolbar
        .sheet(isPresented: $newTask) {
          EditTaskView()
        }
      }//ns

    }//body
  
  private func deleteTask(offsets: IndexSet) {
    for offset in offsets {
      context.delete(tasks[offset])
    }
    try? context.save()
  }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
        .environment(\.managedObjectContext, TaskContainer.preview)
    }
}
