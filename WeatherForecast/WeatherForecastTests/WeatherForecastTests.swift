import XCTest
@testable import WeatherForecast

class WeatherForecastTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCurrentWeatherData() {
        var currentWeatherData: CurrentWeather?
        let jsonDecoder: JSONDecoder = JSONDecoder()
        let dataAssetName: String = "CurrentWeathertestData"
        guard let dataAsset: NSDataAsset = NSDataAsset.init(name: dataAssetName) else {
            return
        }
        
        do {
            currentWeatherData = try jsonDecoder.decode(CurrentWeather.self, from: dataAsset.data)
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
        
        guard let data = currentWeatherData else {
            return
        }
        
        let expectedString = "Mountain View"
        XCTAssertEqual(data.cityName, expectedString)
    }
    
    func testFiveDayWeatherData() {
        var fiveDaysWeatherData: FiveDaysWeather?
        let jsonDecoder: JSONDecoder = JSONDecoder()
        let dataAssetName: String = "FiveDaysWeathertestData"
        guard let dataAsset: NSDataAsset = NSDataAsset.init(name: dataAssetName) else {
            return
        }
        
        do {
            fiveDaysWeatherData = try jsonDecoder.decode(FiveDaysWeather.self, from: dataAsset.data)
        } catch DecodingError.dataCorrupted(let context) {
            print("데이터가 손상되었거나 유효하지 않습니다.")
            print(context.codingPath, context.debugDescription, context.underlyingError ?? "" , separator: "\n")
        } catch DecodingError.keyNotFound(let codingkey, let context) {
            print("주어진 키를 찾을수 없습니다.")
            print(codingkey.intValue ?? Optional(nil)! , codingkey.stringValue , context.codingPath, context.debugDescription, context.underlyingError ?? "" , separator: "\n")
        } catch DecodingError.typeMismatch(let type, let context) {
            print("주어진 타입과 일치하지 않습니다.")
            print(type.self , context.codingPath, context.debugDescription, context.underlyingError ?? "" , separator: "\n")
        } catch DecodingError.valueNotFound(let type, let context) {
            print("예상하지 않은 null 값이 발견되었습니다.")
            print(type.self , context.codingPath, context.debugDescription, context.underlyingError ?? "" , separator: "\n")
        } catch {
            print("그외 에러가 발생했습니다.")
        }
        
        guard let data = fiveDaysWeatherData else {
            print("**************")
            print("데이터 할당 안됨")
            return
        }
        
        let testData: String = "300"
        XCTAssertNotEqual(data.cod, testData)
        XCTAssertEqual(data.lists[0].coordinatedUniversalTime, 1596564000)
        XCTAssertEqual(data.lists[0].weathers[0].iconID, "10d")
        XCTAssertEqual(data.lists[0].rain.threeHour, 0.53)
        XCTAssertEqual(data.lists[0].snow?.threeHour, nil)
    }
}
