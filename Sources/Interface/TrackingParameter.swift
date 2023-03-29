//
//  TrackingParameter.swift
//  Tracker
//
//  Created by Vasiliy Zaytsev on 29.03.2023.
//

public struct TrackingParameter {
  public let count: Int?
  public let value: String
  
  public init(value: String, count: Int? = nil) {
    self.count = count
    self.value = value
  }
}

extension TrackingParameter: ExpressibleByStringLiteral {
  public init(stringLiteral: String) {
    self.init(value: stringLiteral)
  }
}
