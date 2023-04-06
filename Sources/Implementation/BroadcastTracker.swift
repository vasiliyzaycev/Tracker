//
//  BroadcastTracker.swift
//  Tracker
//
//  Created by Vasiliy Zaytsev on 29.03.2023.
//

import Foundation

public actor BroadcastTracker: Tracker {
  private let trackers: [Tracker]
  private var limitedEvents: [String: Date] = .init()
  
  @MainActor
  public init(_ trackers: [Tracker]) {
    self.trackers = trackers
  }
  
  public func track(_ event: Trackable) async throws {
    guard shouldTrack(event) else { return }
    rememberTrackDate(event)
    try await broadcast(event)
  }
}

private extension BroadcastTracker {
  private func shouldTrack(_ event: Trackable) -> Bool {
    guard
      case .rateLimit(let rateLimit) = event.extra?.incidence,
      let lastTrackDate = limitedEvents[event.fullName]
    else {
      return true
    }
    return Date.now.timeIntervalSince(lastTrackDate) > Double(rateLimit)
  }
  
  private func rememberTrackDate(_ event: Trackable) {
    guard case .rateLimit = event.extra?.incidence else { return }
    self.limitedEvents[event.fullName] = .now
  }
  
  private func broadcast(_ event: Trackable) async throws {
    try await withThrowingTaskGroup(of: Void.self) { group in
      for tracker in trackers {
        group.addTask {
          try await tracker.track(event)
        }
      }
      try await group.waitForAll()
    }
  }
}

extension Trackable {
  var fullName: String {
    guard let tags, !tags.isEmpty else { return name }
    return name.appending("_").appending(tags.joined(separator: "_"))
  }
}
