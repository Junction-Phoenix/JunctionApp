import SwiftUI
import Charts

struct DailyGraphView: View {
    @ObservedObject var viewModel: DailyGraphViewModel

    let colorCodes: [ColorCode] = [.graphExcellent, .graphGood, .graphAverage, .graphBad]

    var body: some View {
        Chart {
            ForEach(viewModel.consumption) { consumption in
                BarMark(
                    x: .value("Hour", consumption.id),
                    y: .value("Consumption", consumption.usage)
                ).foregroundStyle(barColor(viewModel.tier(consumption)))
            }
        }
    }

    private func barColor(_ index: Int) -> Color {
        return Color.fromColorCode(colorCodes[index])
    }
}

struct DailyGraphView_Previews: PreviewProvider {
    static var previews: some View {
        DailyGraphView(viewModel: DailyGraphViewModel.Preview)
    }
}
