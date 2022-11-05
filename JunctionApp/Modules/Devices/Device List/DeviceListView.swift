import SwiftUI

struct DeviceListView: View {

    @EnvironmentObject var c: DIContainer

    @ObservedObject var viewModel: DeviceListViewModel

    var body: some View {
        VStack {
            Text("Devices Usage")
                .bold()
                .font(.title)
                .foregroundColor(Color.fromColorCode(.textColor))
            Text(viewModel.date.formattedDate)
                .foregroundColor(Color.fromColorCode(.textColor))

            List {
                ForEach(viewModel.devices) { device in
                    NavigationLink(
                        destination: DeviceStatsView(
                            viewModel: DeviceStatsViewModel(device, viewModel.date)
                        ).environmentObject(c)
                    ) {
                        DeviceRowView(
                            viewModel: DeviceRowViewModel(device)
                        )
                    }
                }
            }
        }
        .task {
            await viewModel.retrieveDevices()
        }
    }
}

struct DeviceListView_Previews: PreviewProvider {
    static var previews: some View {
        let container = Bootstrapper().createContainer()

        DeviceListView(viewModel: DeviceListViewModel(Communicator()))
            .environmentObject(container)
    }
}
