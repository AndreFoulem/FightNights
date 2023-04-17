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
      ScrollView {
        OutlineGroup(Array(familyMembers), children: \.children) { familyMember in
          Text(familyMember.viewName)
        }
        .padding()
      }
    }
}

struct FamilyView_Previews: PreviewProvider {
    static var previews: some View {
        FamilyView()
    }
}
