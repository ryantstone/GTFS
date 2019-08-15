//
//  StopTimeTests.swift
//  GTFSTests
//
//  Created by Ryan Stone on 8/3/19.
//

import XCTest
@testable import GTFS

class StopTimeTests: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }

    func test_parse() {
        let expectedResult = StopTime(tripId: "STBA",
                                      arrivalTime: "6:00:00",
                                      departureTime: "6:00:00",
                                      stopId: "STAGECOACH",
                                      stopSequence: 1,
                                      stopHeadsign: nil,
                                      pickupType: nil,
                                      dropOffType: nil,
                                      shapeDistTraveled: nil,
                                      timepoint: nil)
        
        do {
            let result = try Parser().decodeFile(data: StopTimeMocks.CSV, type: StopTime.self)
            XCTAssertEqual(expectedResult, result.first)
        } catch {
            XCTFail("\(error.localizedDescription)")
        }
        
    }
}

struct StopTimeMocks {
    static let CSV = """
    trip_id,arrival_time,departure_time,stop_id,stop_sequence,stop_headsign,pickup_type,drop_off_type,shape_dist_traveled
    STBA,6:00:00,6:00:00,STAGECOACH,1,,,,
    STBA,6:20:00,6:20:00,BEATTY_AIRPORT,2,,,,
    CITY1,6:00:00,6:00:00,STAGECOACH,1,,,,
    CITY1,6:05:00,6:07:00,NANAA,2,,,,
    CITY1,6:12:00,6:14:00,NADAV,3,,,,
    CITY1,6:19:00,6:21:00,DADAN,4,,,,
    CITY1,6:26:00,6:28:00,EMSI,5,,,,
    CITY2,6:28:00,6:30:00,EMSI,1,,,,
    CITY2,6:35:00,6:37:00,DADAN,2,,,,
    CITY2,6:42:00,6:44:00,NADAV,3,,,,
    CITY2,6:49:00,6:51:00,NANAA,4,,,,
    CITY2,6:56:00,6:58:00,STAGECOACH,5,,,,
    AB1,8:00:00,8:00:00,BEATTY_AIRPORT,1,,,,
    AB1,8:10:00,8:15:00,BULLFROG,2,,,,
    AB2,12:05:00,12:05:00,BULLFROG,1,,,,
    AB2,12:15:00,12:15:00,BEATTY_AIRPORT,2
    BFC1,8:20:00,8:20:00,BULLFROG,1
    BFC1,9:20:00,9:20:00,FUR_CREEK_RES,2
    BFC2,11:00:00,11:00:00,FUR_CREEK_RES,1
    BFC2,12:00:00,12:00:00,BULLFROG,2
    AAMV1,8:00:00,8:00:00,BEATTY_AIRPORT,1
    AAMV1,9:00:00,9:00:00,AMV,2
    AAMV2,10:00:00,10:00:00,AMV,1
    AAMV2,11:00:00,11:00:00,BEATTY_AIRPORT,2
    AAMV3,13:00:00,13:00:00,BEATTY_AIRPORT,1
    AAMV3,14:00:00,14:00:00,AMV,2
    AAMV4,15:00:00,15:00:00,AMV,1
    AAMV4,16:00:00,16:00:00,BEATTY_AIRPORT,2
    """
}
