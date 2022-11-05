import Foundation

class DeviceListViewModel: ObservableObject {

    @Published var devices: [Device] = []
    @Published var date: Date

    private var communicator: CommunicatorProtocol

    init(_ communicator: CommunicatorProtocol, _ date: Date = Date()) {
        self.communicator = communicator
        self.date = date
    }

    @MainActor
    func retrieveDevices() async {
        let received = await communicator.getDevicesConsumption(of: date)

        if let received = received {
            devices = received
                .map{ $0.toDevice() }
                .sorted{ $0.consumption > $1.consumption }
        }
    }
}
