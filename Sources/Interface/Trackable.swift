//
//  Trackable.swift
//  Tracker
//
//  Created by Vasiliy Zaytsev on 29.03.2023.
//

import Foundation

public protocol Trackable {
  /// Unique human-readable identifier of the event in the tracking system.
  var name: String { get }
  
  /// Unstructured human-readable description of the event.
  var message: String? { get }

  /// Tags that help distinguish events with the same name.
  var tags: [String]? { get }
  
  /// More concrete project-specific type of parameters.
  var params: [String: TrackingParameter]? { get }

  /// Extra settings
  var extra: ExtraSettings? { get }
  
//  /// Version of encoding format adopted by event.
//  var formatVersion: Int? { get }
//
//  /// Unique identifier of the current instance of the event.
//  var trackingIdentifier: UUID? { get }
//
//  /// Minimal time in seconds between events with the same name and tags.
//  var rateLimit: Int? { get }
}

public struct ExtraSettings {
  let incidence: Incidence
  let formatVersion: Int?

  public init(incidence: Incidence, formatVersion: Int? = nil) {
    self.incidence = incidence
    self.formatVersion = formatVersion
  }
}

public enum Incidence {
  case incident(UUID)
  case rateLimit(Int)
}
