import UIKit

class ViewController: UIViewController {
    var currentWeatherData: CurrentWeather?
    var fiveDaysWeatherData: FiveDaysWeather?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        decodeCurrentWeatherJSONFile()
        
        guard let currentWeatherData = self.currentWeatherData else {
            return
        }
        
        print(currentWeatherData.locationCoordinate.latitude)
        print(currentWeatherData.rain)
        print(currentWeatherData.rain?.threeHour)

        decodeFiveDaysWeatherJSONFile()

        guard let fiveDaysWeatherData = self.fiveDaysWeatherData else {
            return
        }

        print(fiveDaysWeatherData.cod)
        print(fiveDaysWeatherData.city.name)
        print(fiveDaysWeatherData.lists[0].main.temperatureInCelsius)
    }
    
    func decodeCurrentWeatherJSONFile() {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        let currentWeatherDataAssetName = "CurrentWeathertestData"
        let dataAssetName: String = currentWeatherDataAssetName
        guard let dataAsset: NSDataAsset = NSDataAsset.init(name: dataAssetName) else {
            return
        }
        
        do {
            self.currentWeatherData = try jsonDecoder.decode(CurrentWeather.self, from: dataAsset.data)
        } catch DecodingError.dataCorrupted(let context) {
            print("데이터가 손상되었거나 유효하지 않습니다.")
            print(context.codingPath, context.debugDescription, context.underlyingError ?? "" , separator: "\n")
        } catch DecodingError.keyNotFound(let codingkey, let context) {
            print("주어진 키를 찾을수 없습니다.")
            print(codingkey.intValue ?? 0 , codingkey.stringValue , context.codingPath, context.debugDescription, context.underlyingError ?? "" , separator: "\n")
        } catch DecodingError.typeMismatch(let type, let context) {
            print("주어진 타입과 일치하지 않습니다.")
            print(type.self , context.codingPath, context.debugDescription, context.underlyingError ?? "" , separator: "\n")
        } catch DecodingError.valueNotFound(let type, let context) {
            print("예상하지 않은 null 값이 발견되었습니다.")
            print(type.self , context.codingPath, context.debugDescription, context.underlyingError ?? "" , separator: "\n")
        } catch {
            print("그외 에러가 발생했습니다.")
        }
    }
    
    func decodeFiveDaysWeatherJSONFile() {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        let fiveDaysWeatherDataAssetName = "FiveDaysWeathertestData"
        let dataAssetName: String = fiveDaysWeatherDataAssetName
        guard let dataAsset: NSDataAsset = NSDataAsset.init(name: dataAssetName) else {
            return
        }
        
        do {
            self.fiveDaysWeatherData = try jsonDecoder.decode(FiveDaysWeather.self, from: dataAsset.data)
        } catch DecodingError.dataCorrupted(let context) {
            print("데이터가 손상되었거나 유효하지 않습니다.")
            print(context.codingPath, context.debugDescription, context.underlyingError ?? "" , separator: "\n")
        } catch DecodingError.keyNotFound(let codingkey, let context) {
            print("주어진 키를 찾을수 없습니다.")
            print(codingkey.intValue ?? 0 , codingkey.stringValue , context.codingPath, context.debugDescription, context.underlyingError ?? "" , separator: "\n")
        } catch DecodingError.typeMismatch(let type, let context) {
            print("주어진 타입과 일치하지 않습니다.")
            print(type.self , context.codingPath, context.debugDescription, context.underlyingError ?? "" , separator: "\n")
        } catch DecodingError.valueNotFound(let type, let context) {
            print("예상하지 않은 null 값이 발견되었습니다.")
            print(type.self , context.codingPath, context.debugDescription, context.underlyingError ?? "" , separator: "\n")
        } catch {
            print("그외 에러가 발생했습니다.")
        }
    }
}

