//
//  TaskEntity+.swift
//  FightNights
//
//  Created by AndreMacBook on 2023-03-30.
//
import SwiftUI

extension TaskEntity {
  var viewTaskName: String { taskName ?? "[Enter Task Name]" }
  var viewDueDate: String { dueData?.formatted(date: .numeric, time: .omitted) ?? "N/A" }
  var viewPriority: String { "\(priority).circle.fill" }
  var viewPriorityColor: Color {
    if done {
      return .gray
    } else if priority == 1 {
      return .green
    } else if priority == 2 {
      return .yellow
    }
    
    return .red
  }
}
