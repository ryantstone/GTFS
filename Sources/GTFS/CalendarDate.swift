//
//  File.swift
//  
//
//  Created by Lukas Schmidt on 22.07.19.
//

import Foundation

public enum ExceptionType: Int, Codable {
    case added = 1
    case removed = 2
}

public struct CalendarDate: Codable, Equatable {
    public init(serviceId: String, date: Date, exceptionType: ExceptionType) {
        self.serviceId = serviceId
        self.date = date
        self.exceptionType = exceptionType
    }
    
    public let serviceId: String
    public let date: Date
    public let exceptionType: ExceptionType
    
    public enum CodingKeys: String, CodingKey {
        case serviceId = "service_id"
        case date
        case exceptionType = "exception_type"
    }
}

extension CalendarDate {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.serviceId = try container.decode(String.self, forKey: .serviceId)

        guard
            let dateText = try? container.decode(String.self, forKey: .date),
            let date = DateHelpers.formatter.date(from: dateText) else {
                throw DecodingError.typeMismatch(
                    Date.self,
                    DecodingError.Context(
                        codingPath: [CodingKeys.exceptionType],
                        debugDescription: "Failed to convert date"
                    )
                )
        }

        guard
            let exceptionString = try? container.decode(String.self, forKey: .exceptionType),
            let exceptionInt    = Int(exceptionString),
            let exceptionType   = ExceptionType(rawValue: exceptionInt) else {

            throw DecodingError.typeMismatch(
                ExceptionType.self,
                DecodingError.Context(
                    codingPath: [CodingKeys.exceptionType],
                    debugDescription: "Failed to convert exception type"
                )
            )
        }

        self.date = date
        self.exceptionType = exceptionType
    }
}
