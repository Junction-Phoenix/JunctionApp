import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: UIConstants.buttonMaxWidth)
            .padding(8.0)
            .background(Color.accentColor)
            .foregroundColor(Color.white)
            .font(.title2)
            .cornerRadius(UIConstants.buttonCornerRadius)
    }
}
