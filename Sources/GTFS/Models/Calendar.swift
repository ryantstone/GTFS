//
//  File.swift
//  
//
//  Created by Lukas Schmidt on 22.07.19.
//

import Foundation

public struct GTFSCalendar: Encodable, Equatable, Hashable {
    
    public init(serviceId: String, monday: Bool, tuesday: Bool, wednesday: Bool, thursday: Bool, friday: Bool, saturday: Bool, sunday: Bool, startDate: Date, endDate: Date) {
        self.serviceId = serviceId
        self.monday = monday
        self.tuesday = tuesday
        self.wednesday = wednesday
        self.thursday = thursday
        self.friday = friday
        self.saturday = saturday
        self.sunday = sunday
        self.startDate = startDate
        self.endDate = endDate
    }
    
    
    public let serviceId: String
    public let monday: Bool
    public let tuesday: Bool
    public let wednesday: Bool
    public let thursday: Bool
    public let friday: Bool
    public let saturday: Bool
    public let sunday: Bool
    public let startDate: Date
    public let endDate: Date

    public var calendarDates = Set<CalendarDate>()

    public enum CodingKeys: String, CodingKey {
        case serviceId = "service_id"
        case monday
        case tuesday
        case wednesday
        case thursday
        case friday
        case saturday
        case sunday
        case startDate = "start_date"
        case endDate = "end_date"
        
    }
    
    mutating public func appendCalendarDate(_ calendarDates: Set<CalendarDate>) {
        calendarDates.forEach { self.calendarDates.insert($0) }
    }
}

extension GTFSCalendar: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.serviceId  = try container.decode(String.self, forKey: .serviceId)
        self.monday     = (try container.decode(String.self, forKey: .monday)) == "1"
        self.tuesday    = (try container.decode(String.self, forKey: .tuesday)) == "1"
        self.wednesday  = (try container.decode(String.self, forKey: .wednesday)) == "1"
        self.thursday   = (try container.decode(String.self, forKey: .thursday)) == "1"
        self.friday     = (try container.decode(String.self, forKey: .friday)) == "1"
        self.saturday   = (try container.decode(String.self, forKey: .saturday)) == "1"
        self.sunday     = (try container.decode(String.self, forKey: .sunday)) == "1"
        
        let formatter: DateFormatter = {
           let formatter = DateFormatter()
            formatter.dateFormat = "yyyyMMdd"
            return formatter
        }()

        guard
            let endString   = try? container.decode(String.self, forKey: .endDate),
            let end         = formatter.date(from: endString) else {
                
                throw DecodingError.typeMismatch(
                    URL.self,
                    DecodingError.Context(codingPath: [CodingKeys.endDate],
                                          debugDescription: "Failed to convert end date")
                )
        }

        guard
            let startString = try? container.decode(String.self, forKey: .startDate),
            let start       = formatter.date(from: startString) else {
        
                throw DecodingError.typeMismatch(
                    URL.self,
                    DecodingError.Context(codingPath: [CodingKeys.startDate],
                                          debugDescription: "Failed to convert start date")
                )
        }
        
        self.startDate = start
        self.endDate = end
    }
}
