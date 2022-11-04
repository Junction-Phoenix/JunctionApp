import Foundation

class DIContainer: ObservableObject {

    @Published var communicator: Communicator
    @Published var dailyConsumptionViewModel: DailyConsumptionViewModel

    init(
        _ communicator: Communicator,
        _ dailyConsumptionViewModel: DailyConsumptionViewModel
    ) {
        self.communicator = communicator
        self.dailyConsumptionViewModel = dailyConsumptionViewModel
    }
}
