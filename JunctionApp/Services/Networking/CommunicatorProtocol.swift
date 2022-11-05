import Foundation

protocol CommunicatorProtocol {
    func getConsumption(of date: Date) async -> DailyConsumptionDto?

    func getDevicesConsumption(of date: Date) async -> DevicesDto?
}
