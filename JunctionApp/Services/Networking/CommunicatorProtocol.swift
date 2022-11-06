import Foundation

protocol CommunicatorProtocol {
    func getConsumption(of date: Date) async -> DailyConsumptionDto?

    func getDevicesConsumption(of date: Date) async -> DevicesDto?

    func getDeviceConsumption(id: Int, of date: Date) async -> DailyConsumptionDto?

    func scheduleDevice(id: Int, time: Int, state: Bool) async -> ScheduleDto?
}
