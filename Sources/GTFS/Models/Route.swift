//
//  File.swift
//  
//
//  Created by Lukas Schmidt on 22.07.19.
//

import Foundation

public enum RouteType: Int, Codable, Equatable {
        // Tram, streetcar, or light rail
        case lightRail = 0
        case subway
        case rail
        case bus
        case ferry
        case cabelCar
        case gondola
        case funicular
    }

public struct Route: Codable, Equatable, Hashable {
    public let id: String
    public let agencyId: String?
    public let shortName: String?
    public let longName: String?
    public let description: String?
    public let type: RouteType
    public let url: URL?
    public let color: String?
    public let textColor: String?
    public let sortOrder: Int?
    
    public var trips = Set<Trip>()
    public var fareRules = Set<FareRules>()
    public var agency: Agency? = nil
    
    public enum CodingKeys: String, CodingKey {
            case id = "route_id"
            case agencyId = "agency_id"
            case shortName = "route_short_name"
            case longName = "route_long_name"
            case description = "route_desc"
            case type = "route_type"
            case url = "route_url"
            case color = "route_color"
            case textColor = "route_text_color"
            case sortOrder = "route_sort_order"
    }
}

extension Route {
    public init(from decoder: Decoder) throws {
        let keys = try decoder.container(keyedBy: CodingKeys.self)

        self.id             = try keys.decode(String.self, forKey: .id)
        self.agencyId       = try? keys.decode(String.self, forKey: .agencyId)
        self.shortName      = try keys.decode(String.self, forKey: .shortName)
        self.longName       = try keys.decode(String.self, forKey: .longName)
        self.description    = try? keys.decode(String.self, forKey: .description)
        self.color          = try keys.decode(String.self, forKey: .color)
        self.textColor      = try? keys.decode(String.self, forKey: .textColor)
        self.sortOrder      = try? keys.decode(Int.self, forKey: .sortOrder)

        guard
            let typeString  = try? keys.decode(String.self, forKey: .type),
            let typeInt     = Int(typeString),
            let routeType   = RouteType(rawValue: typeInt) else {

            throw DecodingError.typeMismatch(Int.self, DecodingError.Context.init(codingPath: [CodingKeys.type], debugDescription: "Failed to convert type to Int"))
        }
        
        guard let urlString = try? keys.decode(String.self, forKey: .url) else {
            throw DecodingError.typeMismatch(URL.self, DecodingError.Context.init(codingPath: [CodingKeys.url], debugDescription: "Failed to convert url to native type"))
        }

        self.type   = routeType
        self.url    = URL(string: urlString)

        // Add validation that long || short must be present
    }
}
