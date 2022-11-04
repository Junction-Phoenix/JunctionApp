import SwiftUI

struct DailyConsumptionView: View {

    @ObservedObject var viewModel: DailyConsumptionViewModel

    var body: some View {
        VStack{
            Text(viewModel.date.formattedDate)

            UsageStatsView(viewModel: UsageStatsViewModel(viewModel.consumption))

            DailyGraphView(viewModel: DailyGraphViewModel.Preview)
                .frame(height: 256).padding()
        }.task {
            await viewModel.retrieveConsumption()
        }
    }
}

struct DailyConsumptionView_Previews: PreviewProvider {
    static var previews: some View {
        DailyConsumptionView(viewModel: DailyConsumptionViewModel(Communicator()))
    }
}
