import Foundation

class DeviceListViewModel {

    var devices: [Device] = []

    init(_ devices: [Device]) {
        self.devices = devices
    }

    static var Preview: DeviceListViewModel {
        get {
            return DeviceListViewModel(Device.Preview)
        }
    }
}
