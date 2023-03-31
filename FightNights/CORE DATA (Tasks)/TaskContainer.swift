//
//  TaskContainer.swift
//  FightNights
//
//  Created by AndreMacBook on 2023-03-30.
//

import Foundation
import CoreData

public class TaskContainer {
  let container = NSPersistentContainer(name: "TasksDataModel")
  
  init(forPreview: Bool = false) {
    if(forPreview) {
      container.persistentStoreDescriptions.first!.url = URL(filePath: "/dev/null") }
    
    container.loadPersistentStores { _, _ in }
    
    if(forPreview) {
       TaskContainer.addMockData(moc: container.viewContext) }
  }
}

extension TaskContainer {
  
  static var preview: NSManagedObjectContext {
    let previewContainer = NSPersistentContainer(name: "TasksDataModel")
    previewContainer.persistentStoreDescriptions.first!.url = URL(filePath: "/dev/null")
    previewContainer.loadPersistentStores { _, _ in }
    self.addMockData(moc: previewContainer.viewContext)
    return previewContainer.viewContext
  }
  
  static func addMockData(moc: NSManagedObjectContext) {
    let firstTask = TaskEntity(context: moc)
    firstTask.taskName = "Buy stuff"
    firstTask.done = false
    firstTask.priority = 0
    firstTask.dueData = nil
    
    try! moc.save()
  }
}
