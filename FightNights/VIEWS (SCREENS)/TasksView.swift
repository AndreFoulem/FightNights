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
      NavigationStack {
          List {
            ForEach(tasks) { task in
                  Text(task.viewTaskName)
                    .strikethrough(task.done, color: .red)
                    .foregroundColor(.blue)
            }//for
            .onDelete(perform: deleteTask)
          }//list
          .navigationTitle("Don't Forget")
          .toolbar {
            ToolbarItemGroup {
              Button {
                context.undo()
              } label: {
              Image(systemName: "arrow.uturn.left")
              }
              Button {
                try? context.save()
              } label: { Image(systemName: "checkmark") }
            }
          }//toolbar
      }//ns

    }//body
  
  private func deleteTask(offsets: IndexSet) {
    for offset in offsets {
      context.delete(tasks[offset])
    }
  }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
        .environment(\.managedObjectContext, TaskContainer.preview)
    }
}
