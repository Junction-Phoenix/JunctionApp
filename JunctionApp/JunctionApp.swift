import SwiftUI

@main
struct JunctionApp: App {

    @StateObject var c: DIContainer = Bootstrapper().createContainer()

    var body: some Scene {
        WindowGroup {
            ConsumptionView().environmentObject(c)
        }
    }
}
