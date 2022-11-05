import SwiftUI

struct FakeButton: View {

    var text: String

    var body: some View {
        Text(text)
            .frame(minWidth: 0, maxWidth: UIConstants.buttonMaxWidth)
            .padding(12.0)
            .background(
                LinearGradient(gradient: Gradient(colors: [.accentColor, .fromColorCode(.gradientEndColor)]), startPoint: .leading, endPoint: .trailing)
            )
            .foregroundColor(Color.white)
            .font(.title2)
            .cornerRadius(UIConstants.buttonCornerRadius)
    }
}

struct FakeButton_Previews: PreviewProvider {
    static var previews: some View {
        FakeButton(text: "Click me!")
            .previewLayout(.fixed(width: 196.0, height: 48.0))
    }
}
