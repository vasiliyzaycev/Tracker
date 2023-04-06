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

extension TrackingParameter: CustomStringConvertible {
  public var description: String {
    guard let count else { return value }
    return "\(value): \(count)"
  }
}

extension TrackingParameter: ExpressibleByStringLiteral {
  public init(stringLiteral: String) {
    self.init(value: stringLiteral)
  }
}

extension TrackingParameter: ExpressibleByIntegerLiteral {
  public init(integerLiteral: Int) {
    self.init(value: String(integerLiteral))
  }
}
