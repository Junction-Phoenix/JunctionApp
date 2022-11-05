import SwiftUI

struct DeviceUsageStatsView: View {
    var body: some View {
        HStack {
            Spacer()

            VStack(alignment: .leading) {
                Text("Total usage:")
                    .padding(1.0)
                    .foregroundColor(Color.fromColorCode(.textColor))
                Text("Day total:")
                    .padding(1.0)
                    .foregroundColor(Color.fromColorCode(.textColor))
                Text("Est. savings:")
                    .padding(1.0)
                    .foregroundColor(Color.fromColorCode(.textColor))
            }.padding()

            VStack(alignment: .leading) {
                Text(String(format: "%.2f kWh", 900 / 1000.0))
                    .padding(1.0)
                    .foregroundColor(Color.fromColorCode(.textColor))
                Text(String(format: "%.2f €", 88 / 100.0))
                    .padding(1.0)
                    .foregroundColor(Color.fromColorCode(.textColor))
                Text(String(format: "%.2f €", 69 / 100.0))
                    .padding(1.0)
                    .foregroundColor(Color.fromColorCode(.textColor))
                    .bold()
            }.padding()

            Spacer()
        }
        .padding(UIConstants.padding)
        .background(Color.fromColorCode(.cardBackgroundColor))
        .cornerRadius(UIConstants.cardCornerRadius)
        .shadow(color: Color.fromColorCode(.shadowColor), radius: 4.0, x: 0.0, y: 4.0)
        .shadow(color: Color.fromColorCode(.shadowColor), radius: 16.0, x: 0.0, y: 4.0)
    }
}

struct DeviceUsageStatsView_Previews: PreviewProvider {
    static var previews: some View {
        DeviceUsageStatsView()
    }
}
