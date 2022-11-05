import Foundation

class DeviceListViewModel {

    var devices: [Device] = []
    var date = Date()

    init(_ devices: [Device], _ date: Date = Date()) {
        self.devices = devices
        self.date = date
    }

    static var Preview: DeviceListViewModel {
        get {
            return DeviceListViewModel(Device.Preview)
        }
    }
}
