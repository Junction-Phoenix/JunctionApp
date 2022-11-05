import SwiftUI

struct Consumption: Identifiable {
    var id: Int
    
    var actualUsage: Int
    var estimatedUsage: Int
    var price: Int

    var animate: Bool = false
    
    static var Preview: [Consumption] {
        get {
            return [
                Consumption(id: 1, actualUsage: 33, estimatedUsage: 69, price: 6),
                Consumption(id: 2, actualUsage: 43, estimatedUsage: 68,price: 7),
                Consumption(id: 3, actualUsage: 32, estimatedUsage: 67,price: 5),
                Consumption(id: 4, actualUsage: 0, estimatedUsage: 50,price: 4),
                Consumption(id: 5, actualUsage: 20, estimatedUsage: 48,price: 5),
                Consumption(id: 6, actualUsage: 25, estimatedUsage: 70,price: 7),
                Consumption(id: 7, actualUsage: 22, estimatedUsage: 69,price: 9),
                Consumption(id: 8, actualUsage: 80, estimatedUsage: 68,price: 10),
                Consumption(id: 9, actualUsage: 110, estimatedUsage: 65,price: 8),
                Consumption(id: 10, actualUsage: 139, estimatedUsage: 20,price: 15),
                Consumption(id: 11, actualUsage: 148, estimatedUsage: 11,price: 14),
                Consumption(id: 12, actualUsage: 104, estimatedUsage: 8,price: 10),
                Consumption(id: 13, actualUsage: 91, estimatedUsage: 11,price: 11),
                Consumption(id: 14, actualUsage: 81, estimatedUsage: 12,price: 11),
                Consumption(id: 15, actualUsage: 84, estimatedUsage: 20,price: 12),
                Consumption(id: 16, actualUsage: 90, estimatedUsage: 42,price: 13),
                Consumption(id: 17, actualUsage: 103, estimatedUsage: 69,price: 14),
                Consumption(id: 18, actualUsage: 112, estimatedUsage: 50,price: 12),
            ]
        }
    }
}
