import Foundation

class DeviceStatsViewModel: ObservableObject {

    @Published var device: Device
    @Published var date: Date

    private var communicator: CommunicatorProtocol

    init(_ communicator: CommunicatorProtocol, _ device: Device, _ date: Date = Date()) {
        self.communicator = communicator
        self.device = device
        self.date = date
    }

    @MainActor
    func schedule(_ time: Date, _ state: Bool) async -> Bool {
        let scheduleTime = Int(time.timeIntervalSince1970)

        let obj = await communicator.scheduleDevice(id: device.id, time: scheduleTime, state: state)

        return obj != nil
    }
}
