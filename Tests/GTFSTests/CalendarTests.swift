//
//  CalendarTests.swift
//  GTFSTests
//
//  Created by Ryan Stone on 8/1/19.
//

import XCTest
@testable import GTFS

class CalendarTests: XCTestCase {
    
    lazy var formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        return formatter
    }()
    
    override func setUp() { }
    override func tearDown() { }
    
    func test_parser() {
        let expectedCalendar = GTFSCalendar(serviceId: "WE",
                                            monday: false,
                                            tuesday: false,
                                            wednesday: false,
                                            thursday: false,
                                            friday: false,
                                            saturday: true,
                                            sunday: true,
                                            startDate: formatter.date(from: "20060701")!,
                                            endDate: formatter.date(from: "20060731")!)
        let parsedCalendar = try? Parser().decodeFile(data: MockCalendar.CSV, type: GTFSCalendar.self)
        
        XCTAssertEqual(parsedCalendar!.first!, expectedCalendar)
    }
}

struct MockCalendar {
    static let CSV = """
    service_id,monday,tuesday,wednesday,thursday,friday,saturday,sunday,start_date,end_date
    WE,0,0,0,0,0,1,1,20060701,20060731
    WD,1,1,1,1,1,0,0,20060701,20060731
    """
}
