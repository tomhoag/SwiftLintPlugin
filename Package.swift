// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "SwiftLintPlugin",
    platforms: [
        .iOS(.v17),
        .macOS(.v14),
    ],
    products: [
        .plugin(
            name: "SwiftLintPlugin",
            targets: ["SwiftLintPlugin"])
    ],
    targets: [
        .plugin(
            name: "SwiftLintPlugin",
            capability: .buildTool(),
            dependencies: []
        ),
    ]
)

