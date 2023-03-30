//
//  ParksView.swift
//  FightNights
//
//  Created by AndreMacBook on 2023-03-30.
//

import SwiftUI

struct ParksView: View {
   @FetchRequest<ParkEntity>(sortDescriptors: [])
    private var parks
  
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ParksView_Previews: PreviewProvider {
    static var previews: some View {
        ParksView()
    }
}
