//
//  Trackable+TrackingEvent.swift
//  Tracker
//
//  Created by Vasiliy Zaytsev on 06.04.2023.
//

import Foundation

extension Trackable {
  public static func event(
    name: String,
    tags: [String]? = nil,
    params: [String: TrackingParameter]? = nil,
    rateLimit: Int? = nil
  ) -> Trackable {
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
  ) -> Trackable {
    TrackingEvent(
      name: name,
      tags: tags,
      params: params,
      extra: .init(incidence: .incident(id))
    )
  }
}

private extension ExtraSettings {
  init?(rateLimit: Int?) {
    guard let rateLimit else { return nil }
    self.init(incidence: .rateLimit(rateLimit))
  }
}

