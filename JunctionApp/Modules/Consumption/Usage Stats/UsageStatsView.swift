import SwiftUI

struct UsageStatsView: View {
    @ObservedObject var viewModel: UsageStatsViewModel

    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text("Avg. usage:")
                Text("Avg. price:")
                Text("Day total:")
            }.padding()

            VStack(alignment: .leading) {
                Text(String(format: "%.2f kWh", viewModel.averageUsage / 1000.0))
                Text(String(format: "%.2f €/kWh", viewModel.averagePrice / 100.0))
                Text(String(format: "%.2f €", viewModel.totalPrice / 100.0))

            }.padding()
        }.padding()
    }
}

struct UsageStatsView_Previews: PreviewProvider {
    static var previews: some View {
        UsageStatsView(viewModel: UsageStatsViewModel.Preview) .previewLayout(.fixed(width: 360.0, height: 120.0))
    }
}
