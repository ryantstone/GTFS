import XCTest
@testable import GTFS

class ShapeTests: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }

    func test_shapParser() {
        let expectedShape = Shape(shapeId: "SB_shape",
                                  lat: 26.758744,
                                  lon: -80.076933,
                                  sequence: 1,
                                  distanceTraveled: nil)

        let result = try? Parser().decodeFile(data: ShapeMocks.CSV, type: Shape.self)

        XCTAssertEqual(expectedShape, result!.first)
    }
}

struct ShapeMocks {
    static let CSV = """
    shape_id,shape_pt_lat,shape_pt_lon,shape_pt_sequence
    SB_shape,26.758744,-80.076933,1
    SB_shape,26.755588,-80.072227,2
    SB_shape,26.753194,-80.068691,3
    SB_shape,26.752911,-80.06827,4
    SB_shape,26.752237,-80.067481,5
    SB_shape,26.752159,-80.067391,6
    SB_shape,26.751755,-80.067016,7
    SB_shape,26.751719,-80.066989,8
    SB_shape,26.751132,-80.066555,9
    SB_shape,26.750949,-80.066412,10
    SB_shape,26.749961,-80.065891,11
    SB_shape,26.74913,-80.065565,12
    SB_shape,26.748961,-80.065512,13
    SB_shape,26.748228,-80.065377,14
    SB_shape,26.747436,-80.065265,15
    SB_shape,26.746069,-80.065203,16
    SB_shape,26.736609,-80.06458,17
    SB_shape,26.734926,-80.064468,18
    """
}
