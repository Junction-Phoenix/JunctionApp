import Foundation

class UsageStatsViewModel: ObservableObject {

    @Published var averageUsage: Float = 0
    @Published var averagePrice: Float = 0

    var totalPrice: Float {
        get {
            return Float(averageUsage) * Float(averagePrice)
        }
    }

    init(_ consumption: [Consumption]) {
        averageUsage = average(consumption.map{ $0.usage })
        averagePrice = average(consumption.map{ $0.price })
    }

    private func average(_ numbers: [Int]) -> Float {
        if numbers.count == 0 { return 0.0 }

        let sum = numbers.reduce(0, { x, y in x + y })

        return Float(sum) / Float(numbers.count)
    }

    static var Preview: UsageStatsViewModel {
        get {
            return UsageStatsViewModel(Consumption.Preview)
        }
    }
}
