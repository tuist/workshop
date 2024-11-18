// swift-tools-version: 6.0
@preconcurrency import PackageDescription

let package = Package(
    name: "TuistApp",
    dependencies: [
        .package(url: "https://github.com/httpswift/swifter", .upToNextMajor(from: "1.5.0"))
    ])
