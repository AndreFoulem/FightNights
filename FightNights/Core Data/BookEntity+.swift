//
//  BookEntity+.swift
//  FightNights
//
//  Created by AndreMacBook on 2023-03-23.
//
import SwiftUI

extension BookEntity {
  
  var cover: UIImage {
    if let data = self.cover_,
       let image = UIImage(data: data) {
      return image
    } else {
      return UIImage(systemName: "note.text")!
    }
  }
  
  var title: String {
    self.title_ ?? "No book title"
  }
  
  var lastUpdated: String {
    return "Last updated: " + (self.lastUpdated_?.formatted(date: .numeric, time: .omitted) ?? "N/A" )
  }
  
  var viewPages: String {
    "Pages: \(self.pages)"
  }
  
  var price: String {
    let formatter = NumberFormatter()
    formatter.locale = Locale.current
    formatter.numberStyle = .currency
    return formatter.string(from: self.price_ ?? 0)!
  }
  
  var url: URL {
    return self.url_ ?? URL(string: "https://www.rds.ca")!
  }
  
  var bookid: String {
    bookid_?.uuidString ?? "no id"
  }
  
  
}
