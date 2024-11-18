import SwiftUI
import Swifter
import TuistAppKit

@main
struct TuistApp: App {
    let kit = TuistAppKit()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear(perform: {
                    let server = HttpServer()
                    server["/hello"] = { .ok(.htmlBody("You asked for \($0)")) }
                    try? server.start()
                    print("Server running")
                })
        }
    }
}
