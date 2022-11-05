import SwiftUI

struct DeviceRowView: View {
    var viewModel: DeviceRowViewModel

    var body: some View {
        HStack {
            Image(systemName: "poweroutlet.type.c")
                .imageScale(.large)
                .foregroundColor(
                    viewModel.isOn ? .accentColor :.fromColorCode(.graphBad)
                )

            Text(viewModel.name)
                .bold()
                .foregroundColor(Color.fromColorCode(.textColor))

            Spacer()

            Text(String(format: "%.2f kWh", viewModel.consumption / 1000.0))
                .foregroundColor(Color.fromColorCode(.textColor))
        }
    }
}

struct DeviceRowView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = DeviceRowViewModel(
            name: "Socket",
            isOn: true,
            consumption: 270
        )

        DeviceRowView(viewModel: viewModel)
            .previewLayout(.fixed(width: 196.0, height: 48.0))
    }
}
