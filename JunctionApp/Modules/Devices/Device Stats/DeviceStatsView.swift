import SwiftUI

struct DeviceStatsView: View {

    @EnvironmentObject var c: DIContainer

    @ObservedObject var viewModel: DeviceStatsViewModel

    var body: some View {
        VStack{
            Text(viewModel.device.name)
                .font(.title2)
                .bold()
                .foregroundColor(Color.fromColorCode(.textColor))

            DailyConsumptionView(
                viewModel: DailyConsumptionViewModel(c.communicator, viewModel.date),
                deviceId: viewModel.device.id
            )

            Spacer()
        }
        .padding(UIConstants.padding)
    }
}

struct DeviceStatsView_Previews: PreviewProvider {
    static var previews: some View {
        let container = Bootstrapper().createContainer()

        DeviceStatsView(viewModel: DeviceStatsViewModel(Device.Preview[0]))
            .environmentObject(container)
    }
}
