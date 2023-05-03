//
//  FetchingWithOOView.swift
//  FightNights
//
//  Created by AndreMacBook on 2023-04-25.
//

import SwiftUI

struct FetchingWithOOView: View {
    // inject the OO
    @StateObject var oo: PlanetsOO
    @State private var insert = false
    @State private var selectedPlanet: PlanetEntity?
  
    var body: some View {
      NavigationStack {
        List {
          ForEach(oo.planets) { planet in
            HStack {
              Image(uiImage: planet.viewImage)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 80)
                .cornerRadius(8)
              
              VStack(alignment: .leading, spacing: 8.0) {
                Text(planet.viewName)
                  .font(.title2.weight(.semibold))
                Text(planet.viewOrbitalPeriod)
                  .font(.footnote)
                  .foregroundColor(.red)
              }
              
            }//hs
            .onTapGesture {
              selectedPlanet = planet
            }
            .padding(.vertical, 6)
          }
          .onDelete(perform: oo.delete)
        }//list
        .toolbar {
          ToolbarItem {
            Button {
              insert.toggle()
            } label: {
              Image(systemName: "plus")
            }
          }
        }
        .navigationTitle("Planets")
      }//ns
      .task {
        oo.fetch()
      }
      .sheet(isPresented: $insert) {
        InsertPlanetView(planetsOO: oo)
      }
      .sheet(item: $selectedPlanet) { planet in
        UpdatePlanetView(oo: oo, selectedPlanet: $selectedPlanet)
          .presentationDetents([.height(200)])
      }
      
    }//body
}

extension FetchingWithOOView {
 
  struct InsertPlanetView: View {
    //inject the OO
    let planetsOO: PlanetsOO
    @State private var name = ""
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
      VStack(spacing: 24.0) {
        Text("New Planet")
          .font(.largeTitle.weight(.bold))
        TextField("enter planet name", text: $name)
          .textFieldStyle(.roundedBorder)
        Button("Save") {
          planetsOO.addPlanet(name: name)
          dismiss()
        }
        .buttonStyle(.borderedProminent)
        
        Spacer()
      }
      .padding()
    }
  }
  
  struct UpdatePlanetView: View {
    //inject the OO
    let oo: PlanetsOO
    @Binding var selectedPlanet: PlanetEntity?
    @Environment(\.dismiss) private var dismiss
    @State private var name = ""
    
    var body: some View {
      VStack {
        Text("Update Planet")
          .font(.largeTitle.weight(.bold))
        TextField("planet name", text: $name)
          .textFieldStyle(.roundedBorder)
      }
      
      Button("Save") {
        selectedPlanet!.name = name
        oo.updatePlanet()
        dismiss()
      }
    }
  }
  
}

struct FetchingWithOOView_Previews: PreviewProvider {
    static var previews: some View {
      FetchingWithOOView(oo: PlanetsOO(moc: PlanetsContainer.shared.container.viewContext ))
    }
}
