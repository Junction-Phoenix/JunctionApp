import Foundation

class DIContainer: ObservableObject {

    @Published var communicator: CommunicatorProtocol

    init(
        _ communicator: CommunicatorProtocol
    ) {
        self.communicator = communicator
    }
}
