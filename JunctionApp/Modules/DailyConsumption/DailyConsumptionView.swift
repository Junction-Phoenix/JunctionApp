import SwiftUI

struct DailyConsumptionView: View {

    @ObservedObject var viewModel: DailyConsumptionViewModel

    var body: some View {
        VStack{
            Text(viewModel.date.formattedDate)
                .font(.title2)
                .bold()
                .foregroundColor(Color.fromColorCode(.textColor))

            UsageStatsView(viewModel: UsageStatsViewModel(viewModel.consumption))
                .padding(UIConstants.padding)
            
            DailyGraphView(viewModel: DailyGraphViewModel(viewModel.consumption))
                .frame(height: 336)
                .padding(UIConstants.padding)
        }
        .task {
            await viewModel.retrieveConsumption()
        }
        .onReceive(viewModel.$date, perform: { date in
            Task.init{
                await viewModel.retrieveConsumption()
            }
        })
    }
}

struct DailyConsumptionView_Previews: PreviewProvider {
    static var previews: some View {
        DailyConsumptionView(viewModel: DailyConsumptionViewModel(Communicator()))
    }
}
