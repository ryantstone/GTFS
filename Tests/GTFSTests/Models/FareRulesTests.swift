import XCTest
@testable import GTFS

class FareRulesTests: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }

    func test_parser() {
        let expectedResult = FareRules(fareId: "a",
                                       routeId: "TSW",
                                       originId: "1",
                                       destinationId: "1",
                                       containsId: nil)

        do {
            let result = try Parser().decodeFile(data: FareRulesMock.CSV, type: FareRules.self)

            XCTAssertEqual(expectedResult, result.first)
        } catch {
            XCTFail("\(error.localizedDescription)")
        }
    }
}

struct FareRulesMock {
    static let CSV = """
    fare_id,route_id,origin_id,destination_id,contains_id
    a,TSW,1,1,
    a,TSE,1,1,
    a,GRT,1,1,
    a,GRJ,1,1,
    a,SVJ,1,1,
    a,JSV,1,1,
    a,GRT,2,4,
    a,GRJ,4,2,
    b,GRT,3,3,
    c,GRT,,,6
    """
}
