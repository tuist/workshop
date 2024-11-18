import ProjectDescription

let project = Project(
    name: "TuistAppKit",
    targets: [
        .target(
            name: "TuistAppKit",
            destinations: .iOS,
            product: .framework,
            bundleId: "dev.tuist.TuistAppKit",
            sources: [
                "Sources/**/*.swift"
            ]),
    ])
