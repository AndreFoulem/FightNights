//
//  FamilyContainer.swift
//  FightNights
//
//  Created by AndreMacBook on 2023-04-14.
//

import CoreData

final class FamilyContainer {
  
  let container: NSPersistentContainer
  
  init(forPreview: Bool = false) {
    container = NSPersistentContainer(name: "FamilyDataModel")
    
    let context = container.viewContext
    context.mergePolicy = NSMergeByPropertyStoreTrumpMergePolicy
    
    if(forPreview) {
      container.persistentStoreDescriptions.first!.url = URL(filePath: "/dev/null")
    }
    
     container.loadPersistentStores {  _, _ in }
    
    if(forPreview) {
      Self.addMockData(moc: context)
    }
  }
}

extension FamilyContainer {
  
  static var preview: NSManagedObjectContext {
    let container = NSPersistentContainer(name: "FamilyDataModel")
    container.persistentStoreDescriptions.first!.url = URL(filePath: "/dev/null")
    container.loadPersistentStores { _, _ in }
    Self.addMockData(moc: container.viewContext)
    return container.viewContext
  }
  
  static func addMockData(moc: NSManagedObjectContext) {
    let member1 = FamilyMemberEntity(context: moc)
    member1.name = "Father Steve"
    let member2 = FamilyMemberEntity(context: moc)
    member2.name = "Mother Elisa"
    let member3 = FamilyMemberEntity(context: moc)
    member3.name = "Andre"
    let member4 = FamilyMemberEntity(context: moc)
    member4.name = "John"
    let member5 = FamilyMemberEntity(context: moc)
    member5.name = "Pat"
    let member6 = FamilyMemberEntity(context: moc)
    member6.name = "Pat"
    let member7 = FamilyMemberEntity(context: moc)
    member7.name = "Pat"
    
    try! moc.save()
    
  }
  
}
