import XCTest
@testable import GTFS

class ParserTests: XCTestCase {
    let parser = Parser()
    override func setUp() { }
    override func tearDown() { }

    func test_parseRoutes() {
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

        let routes = try! parser.decode(data: Mocks.routesFile, type: Route.self)
        XCTAssertEqual(expectedRoute, routes.first!)
    }
}

struct Mocks {
    static let routesFile = """
route_id,route_short_name,route_long_name,route_type,route_url,route_color
SB,TRSB,Tri-Rail,2,http://www.tri-rail.com/,006c86
NB,TRNB,Tri-Rail,2,http://www.tri-rail.com/,006c86
51,WPB1,WPB 1,3,http://www.tri-rail.com/stations/west-palm-beach-station/,f78320
52,LKW1,LKW 1,3,http://www.tri-rail.com/stations/lake-worth-station/,f79620
54,BR1,BR 1,3,http://www.tri-rail.com/stations/boca-raton-station/,f78300
55,DB1,DB 1,3,http://www.tri-rail.com/stations/deerfield-beach-station/,9acd66
57,DB2,DB 2,3,http://www.tri-rail.com/stations/deerfield-beach-station/,afcd66
59,PB1,PB 1,3,http://www.tri-rail.com/stations/pompano-beach-station/,9fe166
61,CC1,CC 1,3,http://www.tri-rail.com/stations/cypress-creek-station/,a5e128
62,CC2,CC 2,3,http://www.tri-rail.com/stations/cypress-creek-station/,97ea1b
64,CC3,CC 3,3,http://www.tri-rail.com/stations/cypress-creek-station/,7bd61b
66,FL1,FL 1,3,http://www.tri-rail.com/stations/fort-lauderdale-station/,52ea1b
67,FL2,FL 2,3,http://www.tri-rail.com/stations/fort-lauderdale-station/,4fdb73
68,FL3W,FL 3 Weekend,3,http://www.tri-rail.com/stations/fort-lauderdale-station/,82f173
69,FLA1,FLA 1 Weekday,3,http://www.tri-rail.com/stations/fort-lauderdalehollywood-international-airport-at-dania-beach/,82f13f
70,FLA1W,FLA 1 Weekend,3,http://www.tri-rail.com/stations/fort-lauderdalehollywood-international-airport-at-dania-beach/,82f13f
71,SS1,SS 1,3,http://www.tri-rail.com/stations/sheridan-street-station/,37e63f
"""
}
