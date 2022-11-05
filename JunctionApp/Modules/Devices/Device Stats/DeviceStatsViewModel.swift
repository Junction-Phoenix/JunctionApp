import Foundation

class DeviceStatsViewModel: ObservableObject {

    @Published var device: Device
    @Published var date: Date

    init(_ device: Device, _ date: Date = Date()) {
        self.device = device
        self.date = date
    }
}
