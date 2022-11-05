import SwiftUI

struct DeviceListView: View {
    var viewModel: DeviceListViewModel

    var body: some View {
            List {
                ForEach(viewModel.devices) { device in
                    NavigationLink(destination: DeviceStatsView()) {
                        DeviceRowView(
                            viewModel: DeviceRowViewModel(device)
                        )
                    }
                }
            }
            .navigationTitle("Devices")
//            .task {
//                await viewModel.retrieveDevices()
//            }
    }
}

struct DeviceListView_Previews: PreviewProvider {
    static var previews: some View {
        DeviceListView(viewModel: DeviceListViewModel.Preview)
    }
}
