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
  public var formatVersion: Int?
  public var trackingIdentifier: UUID?
  public var rateLimit: Int?
  
  public init(
    name: String,
    message: String?,
    tags: [String]?,
    params: [String: TrackingParameter]?,
    formatVersion: Int? = nil,
    trackingIdentifier: UUID? = nil,
    rateLimit: Int? = nil
  ) {
    self.name = name
    self.message = message
    self.tags = tags
    self.params = params
    self.formatVersion = formatVersion
    self.trackingIdentifier = trackingIdentifier
    self.rateLimit = rateLimit
  }
}
