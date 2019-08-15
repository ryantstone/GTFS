// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GTFS",
    products: [
        .library( name: "GTFS", targets: ["GTFS"])
    ],
    dependencies: [
        .package(url: "https://github.com/yaslab/CSV.swift", from: "2.4.2")
    ],
    targets: [
        .target( name: "GTFS", dependencies: [ "CSV" ]),
        .testTarget( name: "GTFSTests", dependencies: ["GTFS"])
    ]
)
