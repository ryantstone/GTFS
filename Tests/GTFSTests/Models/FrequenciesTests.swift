import XCTest
@testable import GTFS

class FrequenciesTests: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }

    func testExample() {
        let expectedResult = Frequencies(
            tripId: "AWE1",
            startTime: "05:30:00",
            endTime: "06:30:00",
            headwaySeconds: 300,
            exactTimes: nil
        )

        let result = try? Parser().decodeFile(data: FrequenciesMock.CSV, type: Frequencies.self)

        XCTAssertEqual(expectedResult, result?.first)
    }
}

struct FrequenciesMock {
    static let CSV = """
    trip_id,start_time,end_time,headway_secs
    AWE1,05:30:00,06:30:00,300
    AWE1,06:30:00,20:30:00,180
    AWE1,20:30:00,28:00:00,420
    """
}
