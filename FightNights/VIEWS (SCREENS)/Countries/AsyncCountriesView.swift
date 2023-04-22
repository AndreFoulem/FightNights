//
//  AsyncCountriesView.swift
//  FightNights
//
//  Created by AndreMacBook on 2023-04-20.
//

import SwiftUI
import CoreData

struct AsyncCountriesView: View {
   @Environment(\.managedObjectContext) var context
   @State private var countries: [CountryEntity] = []
  
   @State private var error: Error?
   @State private var showError = false
  
    var body: some View {
      VStack {
        List {
          ForEach(countries) { country in
            Text(country.viewName)
          }
        }
      
        Button("Update & Delete") {
          let selectedCountry = countries[0].objectID
          Task {
            await updateCountry(objectId: selectedCountry)
          }
          Task {
            await deleteCountry(objectId: selectedCountry)
          }
        }
        Button("Get four countries") {
          Task {
            countries = try await context.perform {
              var result: [CountryEntity] = []
              
              let request = CountryEntity.fetchRequest()
              request.fetchLimit = 4
              
              try request.execute().forEach({ countryEntity in
                result.append(countryEntity)
              })
              
              return result
            }
          }//task
        }//button
        .alert("Error", isPresented: $showError, presenting: error) { _ in
        } message: { _ in
          Text("Core Data Error")
        }
     
      }//vs
    
      
    }//body
    
  func functionOne() async {
    try! await Task.sleep(nanoseconds: 1_000_000_000)
    print("functionOne")
  }
  
  func functionTwo() async {
    print("functionTwo")
  }
  
  func updateCountry(objectId: NSManagedObjectID) async {
    print("1")
    await context.perform {
        print("3")
        
      Thread.sleep(forTimeInterval: 1)
      do {
        let country = try context.existingObject(with: objectId) as! CountryEntity
        country.name = "Samoa"
        try context.save()
      } catch {
        print(error.localizedDescription)
      }
    }
  }
  
  func deleteCountry(objectId: NSManagedObjectID) async {
    print("2")
    await context.perform {
      print("4")
      let country = try! context.existingObject(with: objectId) as! CountryEntity
      context.delete(country)
      try! context.save()
    }
  }
  
}

struct AsyncCountriesView_Previews: PreviewProvider {
    static var previews: some View {
      AsyncCountriesView()
        .environment(\.managedObjectContext, CountriesContainer.preview)
    }
}
