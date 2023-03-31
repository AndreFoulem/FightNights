//
//  TaskContainer.swift
//  FightNights
//
//  Created by AndreMacBook on 2023-03-30.
//

import Foundation
import CoreData

public class TaskContainer {
  let container: NSPersistentContainer
  
  init(forPreview: Bool = false) {
    container = NSPersistentContainer(name: "TasksDataModel")
    
    let context = container.viewContext
    context.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
    context.undoManager = UndoManager()
    
    if(forPreview) {
      container.persistentStoreDescriptions.first!.url = URL(filePath: "/dev/null")
    }
    container.loadPersistentStores { _, _ in }
    if(forPreview) {
       TaskContainer.addMockData(moc: container.viewContext)
    }
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
    firstTask.taskName = "Meeting"
    firstTask.done = false
    firstTask.priority = 1
    firstTask.dueData = nil
    
    let secondTask = TaskEntity(context: moc)
    secondTask.taskName = "Prepare for sale"
    secondTask.done = false
    secondTask.priority = 2
    secondTask.dueData = nil
    
    let thirdTask = TaskEntity(context: moc)
    thirdTask.taskName = "get gift for anniversary"
    thirdTask.done = false
    thirdTask.priority = 3
    thirdTask.dueData = nil
    
    let fourthTask = TaskEntity(context: moc)
    fourthTask.taskName = "Get milk"
    fourthTask.done = true
    fourthTask.priority = 1
    fourthTask.dueData = nil
    
    try! moc.save()
  }
}
