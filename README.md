# SwiftLintPlugin

[Linting a Swift package with swift-format](https://medium.com/snapp-mobile/linting-a-swift-package-with-swift-format-a887b4e95a1e) [@oleksii_24924](https://medium.com/@oleksii_24924)

## Usage

In the Package.swift of the package to be linted (i.e. `Clusterables` below), add this plugin as a dependency and add the dependcency as a plugin for the target:

```swift
// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "Clusterables",
    platforms: [
        .iOS(.v17),
        .macOS(.v14),
    ],
    products: [
        .library(
            name: "Clusterables",
            targets: ["Clusterables"])
    ],
    dependencies: [
        .package(url: "https://github.com/NSHipster/DBSCAN", from: "0.0.2"),
        .package(url: "https://github.com/tomhoag/SwiftLintPlugin.git", branch: "main"),
    ],
    targets: [
        .target(
            name: "Clusterables",
            dependencies: [
                .product(name: "DBSCAN", package: "DBSCAN")
            ],
            plugins: [
                .plugin(name: "SwiftLintPlugin", package: "SwiftLintPlugin")
            ]
        )
    ]
)
```
