import Foundation
import Alamofire

class Communicator: CommunicatorProtocol {
    private let apiUrl = "https://power-manager-api.herokuapp.com"

    func getConsumption(of date: Date) async -> DailyConsumptionDto? {
        await withCheckedContinuation { cont in
            let endpoint = "\(apiUrl)/stats/hourly?start=\(date.formattedDate)"
            AF.request(endpoint, method: .get).responseDecodable(of: DailyConsumptionDto.self) { response in
                cont.resume(returning: response.value)
            }
        }
    }

    func getDevicesConsumption(of date: Date) async -> DevicesDto? {
        await withCheckedContinuation { cont in
            let endpoint = "\(apiUrl)/devices/with_consumption?date=\(date.formattedDate)"
            AF.request(endpoint, method: .get).responseDecodable(of: DevicesDto.self) { response in
                cont.resume(returning: response.value)
            }
        }
    }

    func getDeviceConsumption(id: Int, of date: Date) async -> DailyConsumptionDto? {
        await withCheckedContinuation { cont in
            let endpoint = "\(apiUrl)/stats/hourly/device/\(id)?start=\(date.formattedDate)"
            AF.request(endpoint, method: .get).responseDecodable(of: DailyConsumptionDto.self) { response in
                cont.resume(returning: response.value)
            }
        }
    }

    func scheduleDevice(id: Int, time: Int, state: Bool) async -> ScheduleDto? {
        await withCheckedContinuation { cont in
            let endpoint = "\(apiUrl)/schedule"
            let body: [String: Int] = [
                "device_id": id,
                "state": state ? 1 : 0,
                "start": time
            ]

            AF.request(
                endpoint,
                method: .post,
                parameters: body,
                encoder: JSONParameterEncoder.default
            ).responseDecodable(of: ScheduleDto.self) { response in
                cont.resume(returning: response.value)
            }
        }
    }
}
