import XCTest
@testable import GTFS

class RoutesTest: XCTestCase {
    override func setUp() {    }
    override func tearDown() { }

    func testExample() {
        let expectedRoute = Route(id: "SB",
                                  agencyId: nil,
                                  shortName: "TRSB",
                                  longName: "Tri-Rail",
                                  description: nil,
                                  type: .rail,
                                  url: URL(string: "http://www.tri-rail.com/")!,
                                  color: "006c86",
                                  textColor: nil,
                                  sortOrder: nil)
        
        let routes = try! Parser().decodeFile(data: RoutesMock.CSV, type: Route.self)
        XCTAssertEqual(expectedRoute, routes.first!)
    }
}
