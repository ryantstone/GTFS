//
//  FareRules.swift
//  CSV
//
//  Created by Ryan Stone on 8/16/19.
//

import Foundation

public struct FareRules: Equatable, Codable {
    public let fareId: String
    public let routeId: String?
    public let originId: String?
    public let destinationId: String?
    public let containsId: String?

    private enum CodingKeys: String, CodingKey {
        case fareId = "fare_id"
        case routeId = "route_id"
        case originId = "origin_id"
        case destinationId = "destination_id"
        case containsId = "contains_id"
    }
}

extension FareRules {
    public init(from decoder: Decoder) throws {
        let container       = try decoder.container(keyedBy: CodingKeys.self)

        self.fareId         = try container.decode(String.self, forKey: .fareId)
        self.routeId        = try? container.decode(String.self, forKey: .routeId)
        self.originId       = try? container.decode(String.self, forKey: .originId)
        self.destinationId  = try? container.decode(String.self, forKey: .destinationId)
        self.containsId     = try? container.decode(String.self, forKey: .containsId)
    }
}

