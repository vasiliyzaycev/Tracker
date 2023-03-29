// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Tracker",
  platforms: [.iOS(.v15)],
  products: [
    .library(
      name: "Tracker",
      targets: ["Tracker"]),
  ],
  dependencies: [],
  targets: [
    .target(
      name: "Tracker",
      dependencies: [],
      path: "Sources"
    )
  ]
)
