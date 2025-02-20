import XCTest
@testable import GTFS

class StopTests: XCTestCase {

    override func setUp() { }

    override func tearDown() { }

    func test_stopParsing() {
        let expectedResult = Stop(id: "F12",
                                  code: nil,
                                  name: "5 Av/53 St",
                                  description: nil,
                                  latitude: 40.760167,
                                  longitude: -73.975224,
                                  zoneId: nil,
                                  url: nil,
                                  locationType: .station,
                                  parentStation: nil,
                                  stopTimezone: nil,
                                  wheelchairBoarding: nil,
                                  levelId: nil,
                                  platformCode: nil)

        let result = try? Parser().decodeFile(data: StopMocks.CSV, type: Stop.self)
        
        XCTAssertEqual(expectedResult, result!.first!)
    }
}

struct StopMocks {
    static let CSV = """
    stop_id,level_id,stop_name,stop_lat,stop_lon,location_type,parent_station
    F12,,5 Av/53 St,40.760167,-73.975224,1,
    E1,L0,5 Av/53 St SW,40.760474,-73.976099,2,F12
    E2,L0,5 Av/53 St NE,40.76035,-73.97546,2,F12
    E3,L0,5 Av/53 St SE,40.760212,-73.975512,2,F12
    E4,L0,Madison/53 St NE,40.759612,-73.973731,2,F12
    E5,L0,Madison/53 St SE,40.759491,-73.973820,2,F12
    N1,L1,,,40.760457,-73.975912,3,F12
    N2,L1,,40.760531,-73.976111,3,F12
    N3,L1,,40.759746,-73.974203,3,F12
    N4,L1,,40.759679,-73.974064,3,F12
    F12S,,5 Av/53 St,40.760167,-73.975224,0,F12
    B1,L2,,40.759746,-73.974203,4,F12S
    B3,L2,,40.759828,-73.974442,4,F12S
    F12N,,5 Av/53 St,40.760167,-73.975224,0,F12
    B2,L3,,40.760457,-73.975912,4,F12N
    B4,L3,,40.760375,-73.975729,4,F12N
    """
}
