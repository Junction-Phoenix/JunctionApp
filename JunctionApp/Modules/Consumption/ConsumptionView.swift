import SwiftUI

struct ConsumptionView: View {

    @EnvironmentObject var c: DIContainer

    var body: some View {
        VStack {
            Text("Energy Consumption").font(.title)

            DailyConsumptionView(viewModel: c.dailyConsumptionViewModel)

            // TODO: Extract in a separate view as a tab selector
            HStack() {
                Button("1 h") {

                }.buttonStyle(PrimaryButtonStyle())
                Spacer(minLength: UIConstants.buttonSpacing)
                Button("1 d") {

                }.buttonStyle(SecondaryButtonStyle())
                Spacer(minLength: UIConstants.buttonSpacing)
                Button("1 w") {

                }.buttonStyle(SecondaryButtonStyle())
                Spacer(minLength: UIConstants.buttonSpacing)
                Button("1 m") {

                }.buttonStyle(SecondaryButtonStyle())
            }.padding()

            Spacer()
        }.padding()
    }
}

struct ConsumptionView_Previews: PreviewProvider {
    static var previews: some View {
        let container = Bootstrapper().createContainer()

        ConsumptionView().environmentObject(container)
    }
}
