import ProjectDescription

public enum Dependency {
    case module(Module)
    case package(String)
    
    var targetDependency: TargetDependency {
        switch self {
        case let .module(module): TargetDependency.project(target: module.name, path: "../\(module.name)")
        case let .package(package): TargetDependency.external(name: package)
        }
    }
}


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
    
    var dependencies: [Dependency] {
        switch self {
        case .app: [.module(.kit)]
        case .kit: [.package("Swifter")]
        }
    }
    
    var hasTests: Bool {
        switch self {
        case .app: return false
        case .kit: return true
        }
    }
}

public extension Project {
    static func tuist(module: Module) -> Project {
        let dependencies = module.dependencies.map(\.targetDependency)
        var targets: [Target] = [
            .target(name: module.name,
                    destinations: .iOS,
                    product: module.product,
                    bundleId: "dev.tuist.\(module.name)",
                    sources: [
                        "./Sources/**/*.swift"
                    ],
                    dependencies: dependencies)
        ]
        if module.hasTests {
            targets.append( .target(name: "\(module.name)Tests",
                                    destinations: .iOS,
                                    product: .unitTests,
                                    bundleId: "dev.tuist.\(module.name)Tests",
                                    sources: [
                                        "./Tests/**/*.swift"
                                    ],
                                    dependencies: [.target(name: module.name)]))
        }
        return Project(name: module.name, targets: targets)
    }
}
