import Foundation

class DailyConsumptionViewModel: ObservableObject {

    @Published var consumption: [Consumption] = []
    @Published var date: Date

    private var communicator: CommunicatorProtocol
    private var isFetching = false

    init(_ communicator: CommunicatorProtocol, _ date: Date = Date()) {
        self.communicator = communicator
        self.date = date
    }

    @MainActor
    func retrieveConsumption() async {
        if isFetching { return }

        isFetching = true
        let receivedConsumption = await communicator.getConsumption(of: date)

        if let consumptionData = receivedConsumption?.consumption {
            consumption = consumptionData.map{ $0.toConsumption() }.sorted(by: { $0.id < $1.id })
        }

        isFetching = false
    }
}
