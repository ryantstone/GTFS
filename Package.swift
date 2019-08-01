// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GTFS",
    products: [
        .library( name: "GTFS", targets: ["GTFS"])
    ],
    dependencies: [
        .package(url: "https://github.com/swiftcsv/SwiftCSV.git", from: "0.5.5")
    ],
    targets: [
        .target( name: "GTFS", dependencies: [ "SwiftCSV" ]),
        .testTarget( name: "GTFSTests", dependencies: ["GTFS"])
    ]
)
