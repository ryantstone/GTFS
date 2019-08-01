//
//  File.swift
//  
//
//  Created by Lukas Schmidt on 22.07.19.
//

import Foundation

public enum RouteType: String, Codable, Equatable {
        // Tram, streetcar, or light rail
        case lightRail = "0"
        case subway = "1"
        case rail = "2"
        case bus = "3"
        case ferry = "4"
        case cabelCar = "5"
        case gondola = "6"
        case funicular = "7"
    }

public struct Route: Codable, Equatable {
    public init(id: String, agencyId: String?, shortName: String, longName: String, description: String?, type: RouteType, url: URL?, color: String?, textColor: String?, sortOrder: Int?) {
        self.id = id
        self.agencyId = agencyId
        self.shortName = shortName
        self.longName = longName
        self.description = description
        self.type = type
        self.url = url
        self.color = color
        self.textColor = textColor
        self.sortOrder = sortOrder
    }
    
    
    public let id: String
    public let agencyId: String?
    public let shortName: String
    public let longName: String
    public let description: String?
    public let type: RouteType
    public let url: URL?
    public let color: String?
    public let textColor: String?
    public let sortOrder: Int?
    
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

//extension Route: Decodable {
//    public init(from decoder: Decoder) throws {
//        let keys = decoder.container(keyedBy: CodingKeys.self)
//
//        self.type = try keys.decode(Int.self, forKey: .type)
//    }
//}
