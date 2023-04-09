//
//  Trackable+TrackingEvent.swift
//  Tracker
//
//  Created by Vasiliy Zaytsev on 06.04.2023.
//

import Foundation

extension Trackable where Self == TrackingEvent {
  public static func event(
    name: String,
    tags: [String]? = nil,
    params: [String: TrackingParameter]? = nil,
    rateLimit: TimeInterval? = nil
  ) -> Self {
    TrackingEvent(
      name: name,
      tags: tags,
      params: params,
      extra: .init(rateLimit: rateLimit)
    )
  }

  public static func incident(
    name: String,
    tags: [String]? = nil,
    params: [String: TrackingParameter]? = nil,
    id: UUID = UUID()
  ) -> Self {
    TrackingEvent(
      name: name,
      tags: tags,
      params: params,
      extra: .init(incidence: .incident(id))
    )
  }
}

private extension ExtraSettings {
  init?(rateLimit: TimeInterval?) {
    guard let rateLimit else { return nil }
    self.init(incidence: .rateLimit(rateLimit))
  }
}

