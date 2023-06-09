//
//  FamilyView.swift
//  FightNights
//
//  Created by AndreMacBook on 2023-04-14.
//

import SwiftUI

struct FamilyView: View {
    @FetchRequest<FamilyMemberEntity>(sortDescriptors: [], predicate: NSPredicate(format: "children.@count > 0") )
    private var familyMembers
  
    var body: some View {
      NavigationStack {
          List(Array(familyMembers), children: \.viewChildren) { familyMember in
            Text(familyMember.viewName)
              .listRowSeparator(.visible)
              .listRowSeparatorTint(.pink)
          }
         
 
          .navigationTitle("Self References")
        
      }

   
    }//body
}

struct FamilyView_Previews: PreviewProvider {
    static var previews: some View {
        FamilyView()
        .environment(\.managedObjectContext, FamilyContainer.preview)
    }
}
