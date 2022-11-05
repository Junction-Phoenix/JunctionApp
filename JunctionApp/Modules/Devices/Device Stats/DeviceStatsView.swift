import SwiftUI

struct DeviceStatsView: View {
    @ObservedObject var viewModel: DailyConsumptionViewModel

    var body: some View {
        VStack{
            Text("Device name")
                .font(.title2)
                .bold()
                .foregroundColor(Color.fromColorCode(.textColor))

            Text(viewModel.date.formattedDate)
                .foregroundColor(Color.fromColorCode(.textColor))

            UsageStatsView(viewModel: UsageStatsViewModel(viewModel.consumption))
                .padding(UIConstants.padding)

            DailyGraphView(viewModel: DailyGraphViewModel(viewModel.consumption))
                .frame(height: 256)
                .padding(UIConstants.padding)

            Spacer()
        }
        .padding(UIConstants.padding)
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

struct DeviceStatsView_Previews: PreviewProvider {
    static var previews: some View {
        DeviceStatsView(viewModel: DailyConsumptionViewModel(Communicator()))
    }
}
