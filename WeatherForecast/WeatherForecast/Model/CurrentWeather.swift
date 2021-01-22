import Foundation

struct CurrentWeather: Decodable {
    let locationCoordinate: LocationCoordinate
    let weathers: [Weather]
    let base: String
    let main: Main
    let wind: Wind
    let clouds: Clouds
    let rain: Rain?
    let snow: Snow?
    let coordinatedUniversalTime: Int
    let sys: Sys
    let timezone: Int
    let cityID: Int
    let cityName: String
    let cod: Int
    
    enum CodingKeys: String, CodingKey {
        case locationCoordinate = "coord"
        case weathers = "weather"
        case base, main, wind, clouds, rain, snow, sys, timezone, cod
        case coordinatedUniversalTime = "dt"
        case cityID = "id"
        case cityName = "name"
    }
    
    struct LocationCoordinate: Decodable {
        let longitude: Double
        let latitude: Double
        
        enum CodingKeys: String, CodingKey {
            case longitude = "lon"
            case latitude = "lat"
        }
    }
    
    struct Weather: Decodable {
        let stateID: Int
        let main: String
        let description: String
        let iconID: String
        
        enum CodingKeys: String, CodingKey {
            case stateID = "id"
            case main, description
            case iconID = "icon"
        }
    }
    
    struct Main: Decodable {
        private let temperature: Double
        private let feelsLike: Double
        private let minTemperature: Double
        private let maxTemperature: Double
        let pressure: Int
        let humidity: Int
       
        var temperatureInCelsius: Double {
            let convertedValue = (self.temperature - 273)
            return round(convertedValue * 10) / 10
        }
        
        var feelsLikeInCelsius: Double {
            let convertedValue = (self.feelsLike - 273)
            return round(convertedValue * 10) / 10
        }
        
        var minTemperatureInCelsius: Double {
            let convertedValue = (self.minTemperature - 273)
            return round(convertedValue * 10) / 10
        }
        
        var maxTemperatureInCelsius: Double {
            let convertedValue = (self.maxTemperature - 273)
            return round(convertedValue * 10) / 10
        }
        
        enum CodingKeys: String, CodingKey {
            case temperature = "temp"
            case pressure, humidity
            case feelsLike = "feels_like"
            case minTemperature = "temp_min"
            case maxTemperature = "temp_max"
        }
    }
    
    struct Wind: Decodable {
        let speed: Double
        let degree: Int
        
        enum CodingKeys: String, CodingKey {
            case speed
            case degree = "deg"
        }
    }
    
    struct Clouds: Decodable {
        let allOver: Int
        
        enum CodingKeys: String, CodingKey {
            case allOver = "all"
        }
    }
    
    struct Rain: Decodable {
        let oneHour: Double
        let threeHour: Double
        
        enum CodingKeys: String, CodingKey {
            case oneHour = "1h"
            case threeHour = "3h"
        }
    }
    
    struct Snow: Decodable {
        let oneHour: Double
        let threeHour: Double
        
        enum CodingKeys: String, CodingKey {
            case oneHour = "1h"
            case threeHour = "3h"
        }
    }
    
    struct Sys: Decodable {
        let type: Int
        let id: Int
        let message: Double
        let countryCode: String
        let sunriseTime: Int
        let sunsetTime: Int
        
        enum CodingKeys: String, CodingKey {
            case type, id, message
            case countryCode = "country"
            case sunriseTime = "sunrise"
            case sunsetTime = "sunset"
        }
    }
}
