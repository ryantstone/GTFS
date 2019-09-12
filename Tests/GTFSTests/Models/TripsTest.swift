//
//  TripsTest.swift
//  GTFSTests
//
//  Created by Ryan Stone on 8/3/19.
//

import XCTest

class TripsTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

struct MockTrip {
    static let CSV = """
route_id,service_id,trip_id,trip_headsign,direction_id,block_id,shape_id
AB,FULLW,AB1,to Bullfrog,0,1,
AB,FULLW,AB2,to Airport,1,2,
STBA,FULLW,STBA,Shuttle,,,
CITY,FULLW,CITY1,,0,,
CITY,FULLW,CITY2,,1,,
BFC,FULLW,BFC1,to Furnace Creek Resort,0,1,
BFC,FULLW,BFC2,to Bullfrog,1,2,
AAMV,WE,AAMV1,to Amargosa Valley,0,,
AAMV,WE,AAMV2,to Airport,1,,
AAMV,WE,AAMV3,to Amargosa Valley,0,,
AAMV,WE,AAMV4,to Airport,1,,
"""
}
