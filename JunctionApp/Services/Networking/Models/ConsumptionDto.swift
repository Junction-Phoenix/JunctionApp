import Foundation

struct ConsumptionDto: Codable {
    let hour, usage, price: Int

    func toConsumption() -> Consumption {
        return Consumption(id: hour, usage: usage, price: price)
    }
}
