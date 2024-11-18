import ProjectDescription

let project = Project(name: "TuistApp", targets: [
    .target(name: "TuistApp",
            destinations: .iOS,
            product: .app,
            bundleId: "dev.tuist.TuistApp",
            sources: [
                "Sources/TuistApp/**/*.swift"
            ],
            dependencies: [
                .target(name: "TuistAppKit")
            ]),
    .target(
        name: "TuistAppKit",
        destinations: .iOS,
        product: .framework,
        bundleId: "dev.tuist.TuistAppKit",
        sources: [
            "Sources/TuistAppKit/**/*.swift"
        ])
])
