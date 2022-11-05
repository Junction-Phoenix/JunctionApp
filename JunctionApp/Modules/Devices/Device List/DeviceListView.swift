import SwiftUI

struct DeviceListView: View {
    var viewModel: DeviceListViewModel
    
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
                    NavigationLink(destination: DeviceStatsView()) {
                        DeviceRowView(
                            viewModel: DeviceRowViewModel(device)
                        )
                    }
                }
            }
        }
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
