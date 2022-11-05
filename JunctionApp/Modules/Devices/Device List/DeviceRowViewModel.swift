import Foundation

class DeviceRowViewModel {
    let name: String
    let isOn: Bool
    let consumption: Float

    init(name: String, isOn: Bool, consumption: Float) {
        self.name = name
        self.isOn = isOn
        self.consumption = consumption
    }

    init(_ device: Device) {
        name = device.name
        isOn = device.isOn
        consumption = device.consumption
    }
}
