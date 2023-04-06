//
//  TrackingEvent.swift
//  Tracker
//
//  Created by Vasiliy Zaytsev on 29.03.2023.
//

import Foundation

public struct TrackingEvent: Trackable {
  public var name: String
  public var message: String?
  public var tags: [String]?
  public var params: [String: TrackingParameter]?
  public var extra: ExtraSettings?
  
  public init(
    name: String,
    tags: [String]?,
    params: [String: TrackingParameter]?,
    message: String? = nil,
    extra: ExtraSettings? = nil
  ) {
    self.name = name
    self.tags = tags
    self.params = params
    self.message = message
    self.extra = extra
  }
}
