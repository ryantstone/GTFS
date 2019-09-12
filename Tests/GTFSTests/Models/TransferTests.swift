import XCTest
@testable import GTFS

class TransferTests: XCTestCase {

    override func setUp() { }

    override func tearDown() { }

    func test_parser() {
        let expectedResult = Transfer(fromStopId: "S6",
                                      toStopId: "S7",
                                      transferType: .twoTransfers,
                                      minTransferTime: 300)
        
        do {
            let result = try Parser().decodeFile(data: TransferMocks.CSV, type: Transfer.self)
            XCTAssertEqual(expectedResult, result.first)
        } catch {
            XCTFail("\(error.localizedDescription)")
        }
    }
}

struct TransferMocks {
    static let CSV = """
    from_stop_id,to_stop_id,transfer_type,min_transfer_time
    S6,S7,2,300
    S7,S6,3,
    S23,S7,1,
    """
}
