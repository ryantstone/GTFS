import XCTest
@testable import GTFS

class AgencyTests: XCTestCase {

    override func setUp() { }
    override func tearDown() { }

    func test_decodeAgency() {
        let expectedAgency = Agency(id: "FunBus",
                                    name: "The Fun Bus",
                                    url: URL(string: "http://www.thefunbus.org")!,
                                    timezone: "America/Los_Angeles",
                                    language: "en",
                                    phone: "(310) 555-0222",
                                    email: nil,
                                    fareUrl: nil)
        
        let agency = try? Parser().decodeFile(data: MockAgency.CSV, type: Agency.self)
        
        XCTAssertEqual(expectedAgency, agency!.first!)
    }
}

struct MockAgency {
    static let CSV = """
    agency_id,agency_name,agency_url,agency_timezone,agency_phone,agency_lang
    FunBus,The Fun Bus,http://www.thefunbus.org,America/Los_Angeles,(310) 555-0222,en
    """
}
