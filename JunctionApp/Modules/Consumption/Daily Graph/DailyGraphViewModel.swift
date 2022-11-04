import Foundation

class DailyGraphViewModel: ObservableObject {

    @Published var consumption: [Consumption] = []


    private init(_ consumption: [Consumption]) {
        self.consumption = consumption
    }

    static var Preview: DailyGraphViewModel {
        get {
            let data = [
                Consumption(hour: 1, usage: 3.3, price: 6),
                Consumption(hour: 2, usage: 4.3, price: 7),
                Consumption(hour: 3, usage: 3.2, price: 5),
                Consumption(hour: 4, usage: 0, price: 4),
                Consumption(hour: 5, usage: 2.0, price: 5),
                Consumption(hour: 6, usage: 2.5, price: 7),
                Consumption(hour: 7, usage: 2.2, price: 9),
                Consumption(hour: 8, usage: 8.0, price: 10),
                Consumption(hour: 9, usage: 11.0, price: 8),
                Consumption(hour: 10, usage: 13.9, price: 15),
                Consumption(hour: 11, usage: 14.8, price: 14),
                Consumption(hour: 12, usage: 10.4, price: 10),
                Consumption(hour: 13, usage: 9.1, price: 11),
                Consumption(hour: 14, usage: 8.1, price: 11),
                Consumption(hour: 15, usage: 8.4, price: 12),
                Consumption(hour: 16, usage: 9.0, price: 13),
                Consumption(hour: 17, usage: 10.3, price: 14),
                Consumption(hour: 18, usage: 11.2, price: 12),
            ]

            return DailyGraphViewModel(data)
        }
    }
    
}
