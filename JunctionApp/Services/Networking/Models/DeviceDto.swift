import Foundation

struct DeviceDto: Codable {
    let name: String
    let state, interval, id, consumption: Int

    func toDevice() -> Device {
        let isOn = state == 1

        return Device(id: id, name: name, isOn: isOn, consumption: Float(consumption))
    }
}

typealias DevicesDto = [DeviceDto]
