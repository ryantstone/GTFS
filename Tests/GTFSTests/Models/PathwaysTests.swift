import XCTest
@testable import GTFS

class PathwaysTests_PathwaysTests: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }

    func testExample() {
        let result = Parser().decodeFile(data: PathwaysMocks.CSV, type: PathWays.self)

        let expectedResult = Pathways(pathwayId: "E1N1", fromStopId: "E1", toStopId: <#T##String#>, pathwayMode: <#T##PathwayMode#>, isBidirectional: <#T##Bool#>, length: <#T##Double?#>, traversalTime: <#T##Int?#>, stairCount: <#T##Int?#>, maxSlope: <#T##Double?#>, minWidth: <#T##Double?#>, signpostedAs: <#T##String?#>, reverseSignpostedAs: <#T##String?#>)
    }
}

struct PathwaysMocks {
    static let CSV = """
    pathway_id,from_stop_id,to_stop_id,pathway_mode,is_bidirectional
    E1N1,E1,N1,2,1
    E2N1,E2,N1,2,1
    E3N1,E3,N1,2,1
    N1-N2,N1,N2,6,1
    N2-N1,N2,N1,7,1
    N2N3,N2,N3,2,1
    N2-B1,N2,B1,4,0
    B1-N2,B1,N2,4,0
    B1B2,B1,B2,2,1

    B1B3,B1,B3,1,1
    B2B4,B2,B4,1,1

    E4N3,E4,N3,2,1
    E5N3,E5,N3,2,1
    N3-N4,N3,N4,6,1
    N4-N3,N4,N3,7,1
    N4B3,N4,B3,2,1
    N4-B3,N4,B3,4,0
    B3-N4,B3,N4,4,0
    B3B4,B3,B4,2,1
    """
}
