// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "SwiftLintPlugin",
    platforms: [.macOS(.v13)],
    products: [
        .plugin(
            name: "SwiftLintPlugin",
            targets: ["SwiftLintPlugin"]
        )
    ],
    dependencies: [
    ],
    targets: [
        .plugin(
            name: "SwiftLintPlugin",
            capability: .buildTool(),
            dependencies: []
        ),
    ]
)
