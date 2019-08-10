//
//  File.swift
//  
//
//  Created by Lukas Schmidt on 21.07.19.
//

import Foundation

public struct Agency: Codable, Equatable {
    
    public let id: String
    public let name: String
    public let url: URL
    public let timezone: String
    public let language: String?
    public let phone: String?
    public let email: String?
    public let fareUrl: URL?

    public enum CodingKeys: String, CodingKey {
        case id = "agency_id"
        case name = "agency_name"
        case url = "agency_url"
        case timezone = "agency_timezone"
        case language = "agency_lang"
        case phone = "agency_phone"
        case fareUrl = "agency_fare_url"
        case email = "agency_email"
    }
    
    public init(id: String, name: String, url: URL, timezone: String, language: String?, phone: String?, email: String?, fareUrl: URL?) {
            self.id = id
            self.name = name
            self.url = url
            self.timezone = timezone
            self.language = language
            self.phone = phone
            self.email = email
            self.fareUrl = fareUrl
    }
}
