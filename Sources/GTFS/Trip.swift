//
//  File.swift
//  
//
//  Created by Lukas Schmidt on 22.07.19.
//

import Foundation

public enum BikesAllowed: Int, Codable {
    case noInformation = 0
    case atLeastOneBike
    case noBikes
}

public struct Trip: Codable {
    
    public init(routeId: String, serviceId: String, id: String, headsign: String?, shortName: String?, direction: Trip.Direction?, blockId: String?, shapeId: String?, wheelchairAccessible: WheelchairBoarding?, bikesAllowed: BikesAllowed?) {
        self.routeId = routeId
        self.serviceId = serviceId
        self.id = id
        self.headsign = headsign
        self.shortName = shortName
        self.direction = direction
        self.blockId = blockId
        self.shapeId = shapeId
        self.wheelchairAccessible = wheelchairAccessible
        self.bikesAllowed = bikesAllowed
    }
    
    
    public enum Direction: Int, Codable {
        case outbound = 0
        case inbound
    }
    
    public let routeId: String
    public let serviceId: String
    public let id: String
    public let headsign: String?
    public let shortName: String?
    public let direction: Direction?
    public let blockId: String?
    public let shapeId: String?
    public let wheelchairAccessible: WheelchairBoarding?
    public let bikesAllowed: BikesAllowed?
    
    public enum CodingKeys: String, CodingKey {
            case routeId = "route_id"
            case serviceId = "service_id"
            case id = "trip_id"
            case headsign = "trip_headsign"
            case shortName = "trip_short_name"
            case direction = "direction_id"
            case blockId = "block_id"
            case shapeId = "shape_id"
            case wheelchairAccessible = "wheelchair_accessible"
            case bikesAllowed = "bikes_allowed"
    }
    
}

extension Trip {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.routeId    = try container.decode(String.self, forKey: .routeId)
        self.serviceId  = try container.decode(String.self, forKey: .serviceId)
        self.id         = try container.decode(String.self, forKey: .id)
        self.headsign   = try? container.decode(String.self, forKey: .headsign)
        self.shortName  = try? container.decode(String.self, forKey: .shortName)
        self.blockId    = try? container.decode(String.self, forKey: .blockId)
        self.shapeId    = try? container.decode(String.self, forKey: .shapeId)

        guard
            let directionText = try? container.decode(String.self, forKey: .direction),
            let directionInt = Int(directionText),
            let direction = Direction(rawValue: directionInt) else {

                throw DecodingError.typeMismatch(
                    Int.self,
                    DecodingError.Context(codingPath: [CodingKeys.direction],
                                          debugDescription: "Failed to convert direction")
                )
        }

        guard
            let wheelchairText = try? container.decode(String.self, forKey: .wheelchairAccessible),
            let wheelchairInt = Int(wheelchairText),
            let wheelchair = WheelchairBoarding(rawValue: wheelchairInt) else {
                throw DecodingError.typeMismatch(
                    Int.self,
                    DecodingError.Context(codingPath: [CodingKeys.wheelchairAccessible],
                                          debugDescription: "failed to convert wheelchair accessible")
                )
        }

        guard
            let bikesAllowedText = try? container.decode(String.self, forKey: .bikesAllowed),
            let bikesAllowedInt = Int(bikesAllowedText),
            let bikesAllowed = BikesAllowed(rawValue: bikesAllowedInt) else {
                throw DecodingError.typeMismatch(
                    Int.self,
                    DecodingError.Context(codingPath: [CodingKeys.bikesAllowed],
                                          debugDescription: "failed to convert bikes allowed")
                )
        }

        self.bikesAllowed = bikesAllowed
        self.wheelchairAccessible = wheelchair
        self.direction = direction
    }
}
