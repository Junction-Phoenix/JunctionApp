import SwiftUI

struct ConsumptionView: View {

    @EnvironmentObject var c: DIContainer

    @State private var dragOffset = CGSize.zero
    @State private var date = Date()

    private let dragThreshold = 48.0

    var body: some View {
        NavigationView {
            VStack {
                Text("Energy Consumption").font(.largeTitle).padding(UIConstants.padding)

                DailyConsumptionView(viewModel: DailyConsumptionViewModel(c.communicator, date))
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                dragOffset = CGSize(
                                    width: gesture.translation.width,
                                    height: 0.0
                                )
                            }
                            .onEnded { gesture in
                                if abs(dragOffset.width) > dragThreshold {
                                    if dragOffset.width < 0 {
                                        date = Calendar.current.date(
                                            byAdding: .day, value: 1, to: date
                                        ) ?? date
                                    } else {
                                        date = Calendar.current.date(
                                            byAdding: .day, value: -1, to: date
                                        ) ?? date
                                    }
                                }

                                dragOffset = .zero
                            }
                    )

                // TODO: Extract in a separate view as a tab selector
    //            HStack() {
    //                Button("1 h") {
    //
    //                }.buttonStyle(PrimaryButtonStyle())
    //                Spacer(minLength: UIConstants.buttonSpacing)
    //                Button("1 d") {
    //
    //                }.buttonStyle(SecondaryButtonStyle())
    //                Spacer(minLength: UIConstants.buttonSpacing)
    //                Button("1 w") {
    //
    //                }.buttonStyle(SecondaryButtonStyle())
    //                Spacer(minLength: UIConstants.buttonSpacing)
    //                Button("1 m") {
    //
    //                }.buttonStyle(SecondaryButtonStyle())
    //            }.padding()

                Spacer()

                NavigationLink(destination: DeviceListView(viewModel: DeviceListViewModel.Preview)) {
                    FakeButton(text: "Check Devices").padding()
                }
            }.padding()
        }
    }
}

struct ConsumptionView_Previews: PreviewProvider {
    static var previews: some View {
        let container = Bootstrapper().createContainer()

        ConsumptionView().environmentObject(container)
    }
}
