//
//  File.swift
//  
//
//  Created by Lukas Schmidt on 22.07.19.
//

import Foundation

public enum WheelchairBoarding: Int, Codable, Equatable {
    case noInformation = 0
    case someVehicles
    case notPossible
}

public enum LocationType: Int, Codable, Equatable {
       case stopOrPlatform = 0
       case station = 1
       case stationEntracneOrExit = 2
       case genericNode = 3
       case boardingArea = 4
   }

public struct Stop: Codable, Equatable {
    public init(id: String, code: String?, name: String, description: String?, latitude: Double, longitude: Double, zoneId: String?, url: URL?, locationType: LocationType?, parentStation: String?, stopTimezone: String?, wheelchairBoarding: WheelchairBoarding?, levelId: String?, platformCode: String?) {
        self.id = id
        self.code = code
        self.name = name
        self.description = description
        self.latitude = latitude
        self.longitude = longitude
        self.zoneId = zoneId
        self.url = url
        self.locationType = locationType
        self.parentStation = parentStation
        self.stopTimezone = stopTimezone
        self.wheelchairBoarding = wheelchairBoarding
        self.levelId = levelId
        self.platformCode = platformCode
    }
    
    
    public let id: String
    public let code: String?
    public let name: String
    public let description: String?
    public let latitude: Double?
    public let longitude: Double?
    public let zoneId: String?
    public let url: URL?
    public let locationType: LocationType?
    public let parentStation: String?
    public let stopTimezone: String?
    public let wheelchairBoarding: WheelchairBoarding?
    public let levelId: String?
    public let platformCode: String?
    
    public enum CodingKeys: String, CodingKey {
            case id = "stop_id"
            case code = "stop_code"
            case name = "stop_name"
            case description = "stop_desc"
            case latitude = "stop_lat"
            case longitude = "stop_lon"
            case zoneId = "zone_id"
            case url = "stop_url"
            case locationType = "location_type"
            case parentStation = "parent_station"
            case stopTimezone = "stop_timezone"
            case wheelchairBoarding = "wheelchair_boarding"
            case levelId = "level_id"
            case platformCode = "platform_code"
        }
}

extension Stop {
    public init(from decoder: Decoder) throws {
        let keys = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id             = try keys.decode(String.self, forKey: .id)
        self.code           = try? keys.decode(String.self, forKey: .code)
        self.name           = try keys.decode(String.self, forKey: .name)
        self.description    = try? keys.decode(String.self, forKey: .description)
        self.zoneId         = try? keys.decode(String.self, forKey: .zoneId)
        self.platformCode   = try? keys.decode(String.self, forKey: .platformCode)
        self.stopTimezone   = try? keys.decode(String.self, forKey: .stopTimezone) // Maybe convert to a native type?

        let parentStation   = try? keys.decode(String.self, forKey: .parentStation) // Maybe this should in someway connect to a parent station?
        self.parentStation = (parentStation?.isEmpty ?? true) ? nil : parentStation

        let levelId = try? keys.decode(String.self, forKey: .levelId)
        self.levelId        = (levelId?.isEmpty ?? true) ? nil : levelId

        let latitudeResult = Result<String, Error> { try keys.decode(String.self, forKey: .latitude) }
        switch latitudeResult {
        case .success(let latitude):
            self.latitude = Double(latitude)
        case .failure(_):
            self.latitude = nil
        }

        let longitudeResult = Result<String, Error> { try keys.decode(String.self, forKey: .longitude) }
        switch longitudeResult {
        case .success(let longitude):
            self.longitude = Double(longitude)
        case .failure(_):
            self.longitude = nil
        }

        let urlResult = Result<String, Error> { try keys.decode(String.self, forKey: .url) }
        switch urlResult {
        case .success(let url):
            self.url = URL(string: url)
        case .failure(_):
            self.url = nil
        }

        if let locationType = try? keys.decode(String.self, forKey: .locationType),
            let locationInt = Int(locationType) {
            self.locationType = LocationType(rawValue: locationInt)
        } else {
            self.locationType = nil
        }
        
        if let wheelchairText = try? keys.decode(String.self, forKey: .wheelchairBoarding),
            let wheelchairBoarding = Int(wheelchairText) {
            self.wheelchairBoarding = WheelchairBoarding(rawValue: wheelchairBoarding)
        } else {
            self.wheelchairBoarding = nil
        }
    }
}
