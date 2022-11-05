import Foundation

struct Device: Identifiable {
    let id: Int
    let name: String
    let isOn: Bool
    let consumption: Float

    
    static var Preview: [Device] {
        get {
            return [
                Device(id: 1, name: "socket1", isOn: true, consumption: 345),
                Device(id: 2, name: "socket2", isOn: false, consumption: 200),
                Device(id: 3, name: "socket3", isOn: false, consumption: 170),
            ]
        }
    }
}
