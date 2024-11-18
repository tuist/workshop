import ProjectDescription

public enum Module: String {
    case app
    case kit

    var product: Product {
        switch self {
        case .app:
            return .app
        case .kit:
            return .framework
        }
    }

    var name: String {
        switch self  {
        case .app: "TuistApp"
        default: "TuistApp\(rawValue.capitalized)"
        }
    }

    var dependencies: [Module] {
        switch self {
        case .app: [.kit]
        case .kit: []
        }
    }
}

public extension Project {
    static func tuist(module: Module) -> Project {
        let dependencies = module.dependencies.map({ TargetDependency.project(target: $0.name, path: "../\($0.name)") })
        return Project(name: module.name, targets: [
            .target(name: module.name,
                    destinations: .iOS,
                    product: module.product,
                    bundleId: "dev.tuist.\(module.name)",
                    sources: [
                        "./Sources/**/*.swift"
                    ],
                    dependencies: dependencies)
        ])
    }
}
