import SwiftUI

struct Consumption: Identifiable {
    var id = UUID()

    var hour: Int
    var usage: Float
    var price: Int
}
