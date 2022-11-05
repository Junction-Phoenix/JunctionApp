import SwiftUI
import Charts

struct DailyGraphView: View {
    @ObservedObject var viewModel: DailyGraphViewModel

    private let lowerBound: Double = 0
    private let upperBound: Double = 25

    private var xValues: [Double] {
        stride(from: lowerBound, to: upperBound, by: 4).map { $0 }
    }

    private let colorCodes: [ColorCode] = [.graphExcellent, .graphGood, .graphAverage, .graphBad]
    
    var body: some View {
        VStack {
            Text("Electricity usage over the day")
                .font(.title3)
                .foregroundColor(Color.fromColorCode(.textColor))

            Chart {
                ForEach(viewModel.consumption) { consumption in
                    BarMark(
                        x: .value("Hour", consumption.id),
                        y: .value("Consumption", consumption.usage)
                    ).foregroundStyle(barColor(viewModel.tier(consumption)))
                }
            }
            .chartXScale(domain: ClosedRange(uncheckedBounds: (lower: lowerBound, upper: upperBound)))
            .chartXAxis {
                AxisMarks(values: xValues) { value in
                    AxisGridLine(centered: true, stroke: StrokeStyle(dash: [1, 2]))
                    AxisValueLabel() {
                        if let intValue = value.as(Int.self) {
                            Text(String(format: "%02d:00", intValue))
                        }
                    }
                }
            }
            .chartYAxis {
                AxisMarks(position: .leading, values: .automatic) { value in
                    AxisGridLine(centered: true, stroke: StrokeStyle(dash: [1, 2]))
                    AxisValueLabel() {
                        if let intValue = value.as(Int.self) {
                            Text(String(format: "%.2f kWh", Float(intValue) / 1000.0))
                        }
                    }
                }
            }

            VStack {
                HStack {
                    Text("Price legend")
                        .font(.caption)
                        .bold()
                        .foregroundColor(Color.fromColorCode(.textColor))
                    Spacer()
                }.padding(
                    EdgeInsets(
                        top: UIConstants.padding,
                        leading: UIConstants.padding,
                        bottom: 0,
                        trailing: 0
                    )
                )

                HStack {
                    HStack {
                        Image(systemName: "circle.fill")
                            .foregroundColor(barColor(0))
                        Text("Low")
                            .font(.caption)
                            .foregroundColor(Color.fromColorCode(.textColor))
                    }
                    Spacer()

                    HStack {
                        Image(systemName: "circle.fill")
                            .foregroundColor(barColor(1))
                        Text("Medium")
                            .font(.caption)
                            .foregroundColor(Color.fromColorCode(.textColor))
                    }
                    Spacer()

                    HStack {
                        Image(systemName: "circle.fill")
                            .foregroundColor(barColor(2))
                        Text("High")
                            .font(.caption)
                            .foregroundColor(Color.fromColorCode(.textColor))
                    }
                    Spacer()

                    HStack {
                        Image(systemName: "circle.fill")
                            .foregroundColor(barColor(3))
                        Text("Very High")
                            .font(.caption)
                            .foregroundColor(Color.fromColorCode(.textColor))
                    }
                    Spacer()
                }.padding(EdgeInsets(
                    top: UIConstants.padding / 2.0,
                    leading: UIConstants.padding,
                    bottom: UIConstants.padding,
                    trailing: UIConstants.padding
                ))
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
