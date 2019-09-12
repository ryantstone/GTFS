import Foundation
import XCTest
@testable import GTFS

class CalendarDateTests: XCTestCase {
    lazy var formatter: DateFormatter = DateHelpers.formatter

    override func setUp() { }
    override func tearDown() { }

    func test_parseCalendarDate() {
        let expectedResult = CalendarDate(serviceId: "FULLW",
                                          date: formatter.date(from: "20070604")!,
                                          exceptionType: .removed)

        let result = try! Parser().decodeFile(data: MockCalendarDates.CSV,
                                         type: CalendarDate.self)

        XCTAssertEqual(expectedResult, result.first!)
    }
}

struct MockCalendarDates {
    static let CSV = """
    service_id,date,exception_type
    FULLW,20070604,2
    """
}
