import Foundation

class DailyGraphViewModel: ObservableObject {

    @Published var consumption: [Consumption] = []

    private init(_ consumption: [Consumption]) {
        self.consumption = consumption
    }

    static var Preview: DailyGraphViewModel {
        get {
            return DailyGraphViewModel(Consumption.Preview)
        }
    }
    
}
