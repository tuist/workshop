import ProjectDescription

let project = Project(
    name: "TuistApp",
    targets: [
        .target(
            name: "TuistApp",
            destinations: .iOS,
            product: .app,
            bundleId: "dev.tuist.TuistApp",
            sources: [
                "Sources/**/*.swift"
            ],
            dependencies: [
                .project(target: "TuistAppKit", path: "../TuistAppKit")
            ])
    ])
