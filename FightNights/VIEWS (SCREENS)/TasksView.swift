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

   @State private var allSaved = true
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
                allSaved = (context.hasChanges == false)
              } label: {
              Image(systemName: "arrow.uturn.left")
              }
              .disabled(allSaved)
            
              Button {
                try? context.save()
                allSaved = (context.hasChanges == false)
              } label: { Image(systemName: "checkmark") }
                .disabled(allSaved)
            }
          }//toolbar
      }//ns

    }//body
  
  private func deleteTask(offsets: IndexSet) {
    for offset in offsets {
      context.delete(tasks[offset])
      allSaved = false
    }
  }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
        .environment(\.managedObjectContext, TaskContainer.preview)
    }
}
