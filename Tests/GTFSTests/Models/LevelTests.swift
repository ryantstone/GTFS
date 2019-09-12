import XCTest
@testable import GTFS

class LevelTests: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }

    func test_parser() {
        let expectedResult = Level(levelId: "L0", levelIndex: 0, levelName: "Street")
        
        do {
            let result = try Parser().decodeFile(data: LevelMocks.CSV, type: Level.self)
            XCTAssertEqual(expectedResult, result.first)
        } catch {
            XCTFail("\(error.localizedDescription)")
        }
    }
}

struct LevelMocks {
    static let CSV = """
    level_id,level_index,level_name,elevation
    L0,0,Street,0
    L1,-1,Mezzanine,-6
    L2,-2,Southbound,-18
    L3,-3,Northbound,-24
    """
}
