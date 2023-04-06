//
//  SchoolsClassesView.swift
//  FightNights
//
//  Created by AndreMacBook on 2023-04-05.
//

import SwiftUI

struct SchoolsClassesView: View {
    @Environment(\.managedObjectContext) var context
    @FetchRequest<StudentEntity>(sortDescriptors: []) private var students
  
    var body: some View {
      NavigationStack {
        List(students) { student in
          NavigationLink {
            ClassView(student: student)
          } label : {
            Text(student.name ?? "")
          }
        }//list
        .navigationTitle("Title")
      }
    }
}

struct SchoolsClassesView_Previews: PreviewProvider {
    static var previews: some View {
        SchoolsClassesView()
        .environment(\.managedObjectContext, SchoolsContainer.preview)
    }
}
