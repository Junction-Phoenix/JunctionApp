import Foundation

class Bootstrapper {
    
    init() { }
    
    func createContainer() -> DIContainer {
        let communicator = Communicator()
        
        return DIContainer(communicator)
    }
}
