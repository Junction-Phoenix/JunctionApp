import SwiftUI

struct DailyConsumptionView: View {

    @ObservedObject var viewModel: DailyConsumptionViewModel

    var deviceId: Int?

    var body: some View {
        VStack{
            Text(viewModel.date.formattedDate)
                .font(.title3)
                .bold()
                .foregroundColor(Color.fromColorCode(.textColor))

            UsageStatsView(viewModel: UsageStatsViewModel(viewModel.consumption))
                .padding(UIConstants.padding)
            
            DailyGraphView(viewModel: DailyGraphViewModel(viewModel.consumption))
                .frame(height: 336)
                .padding(UIConstants.padding)
        }
        .task {
            await fetch()
        }
        .onReceive(viewModel.$date, perform: { date in
            Task.init{
               await fetch()
            }
        })
    }

    private func fetch() async{
        if let deviceId = deviceId {
            await viewModel.retrieveDeviceConsumption(deviceId)
        } else {
            await viewModel.retrieveTotalConsumption()
        }
    }
}

struct DailyConsumptionView_Previews: PreviewProvider {
    static var previews: some View {
        DailyConsumptionView(viewModel: DailyConsumptionViewModel(Communicator()))
    }
}
