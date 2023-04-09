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
  case rateLimit(TimeInterval)
}
