import Foundation

class Bootstrapper {

    init() { }

    func createContainer() -> DIContainer {
        let communicator = Communicator()

        let dailyConsumptionViewModel = DailyConsumptionViewModel(communicator)

        return DIContainer(communicator, dailyConsumptionViewModel)
    }
}
