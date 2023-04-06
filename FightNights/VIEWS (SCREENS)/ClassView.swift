//
//  ClassView.swift
//  FightNights
//
//  Created by AndreMacBook on 2023-04-05.
//

import SwiftUI

struct ClassView: View {
  let student: StudentEntity
  
    var body: some View {
      Text(student.name ?? "")
    }
}


