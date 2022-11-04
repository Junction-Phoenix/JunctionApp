import Foundation

class UsageStatsViewModel: ObservableObject {

    @Published var averageUsage: Float
    @Published var averagePrice: Int

    var total: String {
        get {
            let cost = averageUsage * Float(averagePrice) / 100.0

            return String(format: "%.2f", cost)
        }
    }

    private init(averageUsage: Float, averagePrice: Int) {
        self.averageUsage = averageUsage
        self.averagePrice = averagePrice
    }

    static var Preview: UsageStatsViewModel {
        get {
            return UsageStatsViewModel(averageUsage: 10.3, averagePrice: 10)
        }
    }
}
