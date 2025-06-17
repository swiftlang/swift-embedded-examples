//
//  Point.swift
//  stm32-lcd-logo
//
//  Created by Rauhul Varma on 3/12/25.
//

struct Point {
  var x: Int
  var y: Int

  func offset(by: Point) -> Point {
    Point(x: x + by.x, y: y + by.y)
  }
}
