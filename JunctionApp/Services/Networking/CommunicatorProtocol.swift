import Foundation

protocol CommunicatorProtocol {
    func getConsumption(of date: Date) async -> DailyConsumptionDto?
}
