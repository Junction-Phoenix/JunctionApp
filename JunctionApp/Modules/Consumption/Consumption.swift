import SwiftUI

struct Consumption: Identifiable {
    var id: Int
    
    var usage: Int
    var price: Int
    
    static var Preview: [Consumption] {
        get {
            return [
                Consumption(id: 1, usage: 33, price: 6),
                Consumption(id: 2, usage: 43, price: 7),
                Consumption(id: 3, usage: 32, price: 5),
                Consumption(id: 4, usage: 0, price: 4),
                Consumption(id: 5, usage: 20, price: 5),
                Consumption(id: 6, usage: 25, price: 7),
                Consumption(id: 7, usage: 22, price: 9),
                Consumption(id: 8, usage: 80, price: 10),
                Consumption(id: 9, usage: 110, price: 8),
                Consumption(id: 10, usage: 139, price: 15),
                Consumption(id: 11, usage: 148, price: 14),
                Consumption(id: 12, usage: 104, price: 10),
                Consumption(id: 13, usage: 91, price: 11),
                Consumption(id: 14, usage: 81, price: 11),
                Consumption(id: 15, usage: 84, price: 12),
                Consumption(id: 16, usage: 90, price: 13),
                Consumption(id: 17, usage: 103, price: 14),
                Consumption(id: 18, usage: 112, price: 12),
            ]
        }
    }
}
