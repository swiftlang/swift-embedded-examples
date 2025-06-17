//
//  Color.swift
//  stm32-lcd-logo
//
//  Created by Rauhul Varma on 3/12/25.
//

struct Color {
  var red: UInt8
  var green: UInt8
  var blue: UInt8
}

extension Color {
  static func gray(_ value: UInt8) -> Color {
    Color(red: value, green: value, blue: value)
  }
}
