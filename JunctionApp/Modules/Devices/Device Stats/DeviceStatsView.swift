import SwiftUI

struct DeviceStatsView: View {

    @EnvironmentObject var c: DIContainer

    @ObservedObject var viewModel: DeviceStatsViewModel

    @State private var date = Date()
    @State private var deviceState: Bool = false
    @State private var showingAlert = false

    init(viewModel: DeviceStatsViewModel) {
        self.viewModel = viewModel
        self.date = date
        self.deviceState = viewModel.device.isOn
    }

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

            VStack {
                DatePicker(
                    "Time",
                    selection: $date,
                    displayedComponents: [.date, .hourAndMinute]
                )

                Toggle(isOn: $deviceState) {
                    Text("State")
                }

                Button("Schedule") {
                    Task {
                        showingAlert = await viewModel.schedule(date, deviceState)
                    }
                }
                .buttonStyle(PrimaryButtonStyle())
                .alert(isPresented: $showingAlert) {
                    Alert(
                        title: Text("Device scheduled!"),
                        message: Text("\(viewModel.device.name) will be turned \(deviceState ? "on" : "off")!"),
                        dismissButton: .default(Text("Got it!"))
                    )
                }
            }
            .padding()
            .background(Color.fromColorCode(.cardBackgroundColor))
            .cornerRadius(UIConstants.cardCornerRadius)
            .shadow(color: Color.fromColorCode(.shadowColor), radius: 4.0, x: 0.0, y: 4.0)
            .shadow(color: Color.fromColorCode(.shadowColor), radius: 16.0, x: 0.0, y: 4.0)
        }
        .padding(UIConstants.padding)
    }
}

struct DeviceStatsView_Previews: PreviewProvider {
    static var previews: some View {
        let container = Bootstrapper().createContainer()

        DeviceStatsView(viewModel: DeviceStatsViewModel(Communicator(), Device.Preview[0]))
            .environmentObject(container)
    }
}
