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

public struct CalendarDate: Codable {
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
