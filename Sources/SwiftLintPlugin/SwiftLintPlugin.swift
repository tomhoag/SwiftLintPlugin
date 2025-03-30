//
//  SwiftLintPlugin.swift
//  Clusterables
//
//  Created by Tom Hoag on 3/30/25.
//

import Foundation
import PackagePlugin

/// Entry point for the SwiftLintPlugin.
@main
struct SwiftLintPlugin: BuildToolPlugin {
    /// This entry point is called when operating on a Swift package.
    func createBuildCommands(context: PluginContext, target: Target) throws -> [Command] {

        let scriptPath = context.package.directoryURL
            .appending(components: "Resources")
            .appending(components: "swift-format-lint-script.sh")
            .path()

        let configurationPath = context.package.directoryURL
            .appending(components: "Resources")
            .appending(components: "swift-format-default-config.json")
            .path()

        let packagePath = context.package.directoryURL.path()

        return [
            .buildCommand(
                displayName: "Running SwiftLintPlugin",
                executable: URL(filePath: "/bin/bash"),
                arguments: [
                    scriptPath,
                    packagePath,
                    configurationPath,
                ],
                environment: [:],
                inputFiles: [],
                outputFiles: []
            )
        ]
    }
}
