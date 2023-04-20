//
//  CountiresView.swift
//  FightNights
//
//  Created by AndreMacBook on 2023-03-31.
//

import SwiftUI

struct CountiresView: View {
  @FetchRequest<CountryEntity>(sortDescriptors: []) private var countries
  
    var body: some View {
      
      NavigationStack {
        List(countries) { country in
          NavigationLink {
            EditCountry(countryEntity: country)
          } label : {
            Text(country.viewName)
          }
        }//list
        .navigationTitle("Countries")
      }//ns
      
    }
}

struct EditCountry: View {
  let countryEntity: CountryEntity?
  
  @Environment(\.managedObjectContext) private var context
  @Environment(\.dismiss) private var dismiss
  @State private var country = ""
  
  var body: some View {
    VStack {
      TextField("country", text: $country)
        .textFieldStyle(.roundedBorder).padding()
      Button("Save") {
        if countryEntity!.name != country {
          countryEntity!.name = country
        }
        if context.hasChanges {
          print("changed and saved")
          try? context.save()
        }
        dismiss()
      }
      .buttonStyle(.borderedProminent)
      Spacer()
    }//vs
    .onAppear {
      country = countryEntity!.name ?? ""
    }
  }
}

struct CountiresView_Previews: PreviewProvider {
    static var previews: some View {
        CountiresView()
        .environment(\.managedObjectContext, CountriesContainer.preview)
    }
}
