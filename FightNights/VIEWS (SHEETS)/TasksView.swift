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
  
    var body: some View {
      List {
        ForEach(tasks) { task in
          Text(task.viewTaskName)
            .strikethrough(task.done, color: .red)
            .swipeActions(allowsFullSwipe: true) {
              Button {
                task.done.toggle()
                try? context.save()
              } label: {
                Image(systemName: task.done ? "arrow.uturn.backward.square" : "checkmark.square")
              }
              .tint(task.done ? .gray : .red)
            }
        }
      
      }
    }
  
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
