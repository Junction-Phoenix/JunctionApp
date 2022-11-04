import SwiftUI
import Charts

struct DailyGraphView: View {
    @ObservedObject var viewModel: DailyGraphViewModel

    var body: some View {
        Chart {
            ForEach(viewModel.consumption) { consuption in
                BarMark(
                    x: .value("Hour", consuption.hour),
                    y: .value("Consumption", consuption.usage)
                ).foregroundStyle(by: .value("Price", consuption.price))
                    .annotation() {
                        Image(systemName: "bolt.fill")
                            .foregroundColor(Color.accentColor)
                    }
            }
        }
    }
}

struct DailyGraphView_Previews: PreviewProvider {
    static var previews: some View {
        DailyGraphView(viewModel: DailyGraphViewModel.Preview)
    }
}
