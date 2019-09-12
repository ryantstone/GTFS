import XCTest
@testable import GTFS

class FareAttributeTests: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }

    func test_parser() {
        let expected = FareAttributes(fareId: "1",
                                      price: 0.00,
                                      currencyType: "USD",
                                      paymentMethod: PaymentMethod(rawValue: 0)!,
                                      transfers: TransferType(rawValue: 0)!,
                                      agencyId: nil,
                                      transferDuration: 0)
        do {
            let result = try Parser().decodeFile(data: FareAttributesMock.CSV, type: FareAttributes.self)
            XCTAssertEqual(expected, result.first!)
        } catch {
            XCTFail("Failed to decode fare attributes \(error.localizedDescription)")
        }

    }
}

struct FareAttributesMock {
    static let CSV = """
    fare_id,price,currency_type,payment_method,transfers,transfer_duration
    1,0.00,USD,0,0,0
    2,0.50,USD,0,0,0
    3,1.50,USD,0,0,0
    4,2.00,USD,0,0,0
    5,2.50,USD,0,0,0
    """
}
