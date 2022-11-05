import Foundation

class UsageStatsViewModel: ObservableObject {

    @Published var totalUsage: Float = 0 // Wh
    @Published var totalPrice: Float = 0 // ct/kWh
    @Published var estimatedSavings: Float = 0 // ct/kWh

    init(_ consumption: [Consumption]) {
        totalUsage = Float(consumption.reduce(0.0) { $0 + Double($1.actualUsage) })
        totalPrice = Float(consumption.reduce(0.0) { $0 + Double(($1.actualUsage * $1.price)) }) / 1000.0

        let estimatedPrice = Float(consumption.reduce(0.0) { $0 + Double(($1.estimatedUsage * $1.price)) }) / 1000.0
        estimatedSavings = totalPrice - estimatedPrice
    }

    static var Preview: UsageStatsViewModel {
        get {
            return UsageStatsViewModel(Consumption.Preview)
        }
    }
}
