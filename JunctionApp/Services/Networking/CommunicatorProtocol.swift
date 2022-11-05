import Foundation

protocol CommunicatorProtocol {
    func getConsumption(of date: Date) async -> DailyConsumptionDto?

    func getDevicesConsumption(of date: Date) async -> DevicesDto?

    func getDeviceConsumoption(id: Int, of date: Date) async -> DailyConsumptionDto?
}
