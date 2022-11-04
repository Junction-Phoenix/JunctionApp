import SwiftUI

struct UsageStatsView: View {
    @ObservedObject var viewModel: UsageStatsViewModel

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Avg. usage:")
                    .padding(1.0)
                    .foregroundColor(Color.fromColorCode(.textColor))
                Text("Avg. price:")
                    .padding(1.0)
                    .foregroundColor(Color.fromColorCode(.textColor))
                Text("Day total:")
                    .padding(1.0)
                    .foregroundColor(Color.fromColorCode(.textColor))
                    .bold()
            }.padding()

            VStack(alignment: .leading) {
                Text(String(format: "%.2f kWh", viewModel.averageUsage / 1000.0))
                    .padding(1.0)
                    .foregroundColor(Color.fromColorCode(.textColor))
                Text(String(format: "%.2f €/kWh", viewModel.averagePrice / 100.0))
                    .padding(1.0)
                    .foregroundColor(Color.fromColorCode(.textColor))
                Text(String(format: "%.2f €", viewModel.totalPrice / 100.0))
                    .padding(1.0)
                    .foregroundColor(Color.fromColorCode(.textColor))
                    .bold()

            }.padding()
        }
        .padding(UIConstants.padding)
        .background(Color.fromColorCode(.cardBackgroundColor))
        .cornerRadius(UIConstants.cardCornerRadius)
        .shadow(color: Color.fromColorCode(.shadowColor), radius: 4.0, x: 0.0, y: 4.0)
        .shadow(color: Color.fromColorCode(.shadowColor), radius: 16.0, x: 0.0, y: 4.0)
    }
}

struct UsageStatsView_Previews: PreviewProvider {
    static var previews: some View {
        UsageStatsView(viewModel: UsageStatsViewModel.Preview) .previewLayout(.fixed(width: 360.0, height: 120.0))
    }
}
