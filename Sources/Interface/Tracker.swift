//
//  Tracker.swift
//  Tracker
//
//  Created by Vasiliy Zaytsev on 29.03.2023.
//

public protocol Tracker {
  func track(_ event: Trackable) async throws
}
