//
//  Tracker.swift
//  Tracker
//
//  Created by Vasiliy Zaytsev on 29.03.2023.
//

public protocol Tracker {
  func track(_ event: Trackable) async throws
}

extension Tracker {
  public func asyncTrack(_ event: Trackable, priority: TaskPriority? = nil) {
    Task(priority: priority) {
      try await track(event)
    }
  }
}
