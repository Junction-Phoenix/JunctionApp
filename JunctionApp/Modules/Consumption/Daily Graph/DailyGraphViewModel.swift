import Foundation

class DailyGraphViewModel: ObservableObject {

    @Published var consumption: [Consumption] = []

    private var maxPrice: Float
    private var minPrice: Float

    private var q1: Float!
    private var q2: Float!
    private var q3: Float!

    init(_ consumption: [Consumption]) {
        self.consumption = consumption

        maxPrice = Float(consumption.compactMap{ $0.price }.max() ?? 0)
        minPrice = Float(consumption.compactMap{ $0.price }.min() ?? 0)

        q2 = average(minPrice, maxPrice)
        q1 = average(minPrice, q2)
        q3 = average(q2, maxPrice)
    }

    private func average(_ x: Float, _ y: Float) -> Float {
        return Float(x + y) / 2.0
    }

    func tier(_ consumption: Consumption) -> Int {
        let price = Float(consumption.price)

        if price >= minPrice && price < q1 {
            return 0
        } else if price >= q1 && price < q2 {
            return 1
        } else if price >= q2 && price < q3 {
            return 2
        } else {
            return 3
        }
    }

    static var Preview: DailyGraphViewModel {
        get {
            return DailyGraphViewModel(Consumption.Preview)
        }
    }
}
