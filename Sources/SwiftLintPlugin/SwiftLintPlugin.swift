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
    func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
        // Get the path to the plugin's Resources directory
        let pluginPath = URL(filePath: context.pluginWorkDirectoryURL.path())
            .deletingLastPathComponent() // remove 'plugins'
            .deletingLastPathComponent() // remove 'derived'
            .deletingLastPathComponent() // remove target name
            .appending(component: "checkouts")
            .appending(component: "SwiftLintPlugin")

        let scriptPath = pluginPath
            .appending(components: "Resources", "swift-format-lint-script.sh")

        let configurationPath = pluginPath
            .appending(components: "Resources", "swift-format-default-config.json")

        return [
            .buildCommand(
                displayName: "Running SwiftLintPlugin",
                executable: try context.tool(named: "bash").url,
                arguments: [
                    scriptPath.path,
                    context.package.directoryURL.path(),
                    configurationPath.path
                ],
                environment: [:],
                inputFiles: [],
                outputFiles: []
            )
        ]
    }
}
