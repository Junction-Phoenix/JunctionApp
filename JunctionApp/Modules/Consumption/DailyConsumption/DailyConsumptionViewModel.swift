import Foundation

class DailyConsumptionViewModel: ObservableObject {

    @Published var consumption: [Consumption] = []

    var date: Date

    private var communicator: Communicator

    init(_ communicator: Communicator, _ date: Date = Date()) {
        self.communicator = communicator

        self.date = date
    }

    @MainActor
    func retrieveConsumption() async {
        let receivedConsumption = await communicator.getConsumption(of: date)

        if let consumptionData = receivedConsumption?.consumption {
            consumption = consumptionData.map{ $0.toConsumption() }.sorted(by: { $0.id < $1.id })
        }
    }
}
