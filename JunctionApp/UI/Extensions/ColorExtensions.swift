import SwiftUI

extension Color {
    static func fromColorCode(_ colorCode: ColorCode) -> Color {
        return Color(colorCode.rawValue)
    }
}
