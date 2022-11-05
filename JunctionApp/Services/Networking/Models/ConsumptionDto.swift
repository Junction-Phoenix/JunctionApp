import Foundation

struct ConsumptionDto: Codable {
    let hour: Int
    let actualUsage: Int
    let predictedUsage: Int
    let price: Int

    func toConsumption() -> Consumption {
        return Consumption(id: hour, usage: actualUsage, price: price)
    }
}
