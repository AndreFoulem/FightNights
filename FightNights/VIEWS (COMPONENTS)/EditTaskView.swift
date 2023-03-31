//
//  EditTaskView.swift
//  FightNights
//
//  Created by AndreMacBook on 2023-03-31.
//

import SwiftUI

struct EditTaskView: View {
  @Environment(\.managedObjectContext) var context
  @Environment(\.dismiss) var dismiss
  @State private var taskName: String = ""
  @State private var priority = 0
  @State private var dueDate = Date()
  
  let task: TaskEntity?
  
  var body: some View {
    VStack(spacing: 16) {
      TextField("task", text: $taskName)
        .textFieldStyle(.roundedBorder)
      VStack(alignment: .leading) {
        Text("Priority")
        Picker(selection: $priority) {
          Text("1").tag(1)
          Text("2").tag(2)
          Text("3").tag(3)
        } label: {
          Text("Priority")
        }
        .pickerStyle(.segmented)
      }
    DatePicker("DueDate", selection: $dueDate)
      Button("Save") {
        task?.taskName = taskName
        task?.priority = Int16(priority)
        task?.dueData = dueDate
        
        try? context.save()
        
        dismiss()
      }
      .buttonStyle(.borderedProminent)
      .frame(maxWidth: .infinity)
      Spacer()
    }//vs
    .padding()
    .onAppear {
      taskName = task?.viewTaskName ?? ""
      priority = Int(task?.priority ?? 0)
      dueDate = task?.dueData ?? Date()
    }
    .navigationTitle("Edit Task")
  }
}

struct EditTaskView_Previews: PreviewProvider {
    static var previews: some View {
      EditTaskView(task: TaskEntity())
        .environment(\.managedObjectContext, TaskContainer.preview)
    }
}
