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

public enum Direction: Int, Codable {
    case outbound = 0
    case inbound
}

public class Trip {

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
    public var route: Route? = nil
    public var stopTimes = Set<StopTime>()
    public var calendar: GTFSCalendar?
    public var shapes = [Shape]()
    public var frequencies = Set<Frequencies>()

    internal init(routeId: String, serviceId: String, id: String, headsign: String?, shortName: String?, direction: Direction?, blockId: String?, shapeId: String?, wheelchairAccessible: WheelchairBoarding?, bikesAllowed: BikesAllowed?, calendar: GTFSCalendar?) {
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
        self.calendar = calendar
    }
   
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.routeId    = try container.decode(String.self, forKey: .routeId)
        self.serviceId  = try container.decode(String.self, forKey: .serviceId)
        self.id         = try container.decode(String.self, forKey: .id)
        self.headsign   = try? container.decode(String.self, forKey: .headsign)
        self.shortName  = try? container.decode(String.self, forKey: .shortName)
        self.blockId    = try? container.decode(String.self, forKey: .blockId)
        self.shapeId    = try? container.decode(String.self, forKey: .shapeId)
        
        self.direction = { try? container.decode(String.self, forKey: .direction) }()
            .flatMap(Int.init)
            .flatMap(Direction.init)
        
        self.wheelchairAccessible = { try? container.decode(String.self, forKey: .wheelchairAccessible) }()
            .flatMap(Int.init)
            .flatMap(WheelchairBoarding.init)
        
        self.bikesAllowed = { try? container.decode(String.self, forKey: .bikesAllowed) }()
            .flatMap(Int.init)
            .flatMap(BikesAllowed.init)
    }
    
    // MARK: - Coding Keys
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

extension Trip: Codable {}

extension Trip: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(routeId)
        hasher.combine(serviceId)
        hasher.combine(id)
        hasher.combine(headsign)
        hasher.combine(shortName)
        hasher.combine(direction)
        hasher.combine(blockId)
        hasher.combine(shapeId)
        hasher.combine(wheelchairAccessible)
        hasher.combine(bikesAllowed)
        hasher.combine(route)
        hasher.combine(stopTimes)
        hasher.combine(calendar)
        hasher.combine(shapes)
        hasher.combine(frequencies)
    }
}

extension Trip: Equatable {
    public static func == (lhs: Trip, rhs: Trip) -> Bool {
        return
            lhs.routeId == rhs.routeId &&
            lhs.serviceId == rhs.serviceId &&
            lhs.id == rhs.id &&
            lhs.headsign == rhs.headsign &&
            lhs.shortName == rhs.shortName &&
            lhs.direction == rhs.direction &&
            lhs.blockId == rhs.blockId &&
            lhs.shapeId == rhs.shapeId &&
            lhs.wheelchairAccessible == rhs.wheelchairAccessible &&
            lhs.bikesAllowed == rhs.bikesAllowed &&
            lhs.route == rhs.route &&
            lhs.stopTimes == rhs.stopTimes &&
            lhs.calendar == rhs.calendar &&
            lhs.shapes == rhs.shapes &&
            lhs.frequencies == rhs.frequencies
    }
}
