//
//  File.swift
//  
//
//  Created by Lukas Schmidt on 22.07.19.
//

import Foundation

public enum Timepoint: Int, Codable {
    case approximate = 0
    case exact
}

public struct StopTime: Codable {
    
    public init(tripId: String, arrivalTime: String?, departureTime: String?, stopId: String, stopSequence: Int, stopHeadsign: String?, pickupType: StopTime.Boarding?, dropOffType: StopTime.Boarding?, shapeDistTraveled: Double?, timepoint: Timepoint?) {
        self.tripId = tripId
        self.arrivalTime = arrivalTime
        self.departureTime = departureTime
        self.stopId = stopId
        self.stopSequence = stopSequence
        self.stopHeadsign = stopHeadsign
        self.pickupType = pickupType
        self.dropOffType = dropOffType
        self.shapeDistTraveled = shapeDistTraveled
        self.timepoint = timepoint
    }
    
    
    public enum Boarding: Int, Codable {
        case scheduled = 0
        case none
        case phoneAgency
        case coordinateWithDriver
    }
    
    public let tripId: String
    public let arrivalTime: String?
    public let departureTime: String?
    public let stopId: String
    public let stopSequence: Int
    public let stopHeadsign: String?
    public let pickupType: Boarding?
    public let dropOffType: Boarding?
    public let shapeDistTraveled: Double?
    public let timepoint: Timepoint?
    
    public enum CodingKeys: String, CodingKey {
        case tripId = "trip_id"
        case arrivalTime = "arrival_time"
        case departureTime = "departure_time"
        case stopId = "stop_id"
        case stopSequence = "stop_sequence"
        case stopHeadsign = "stop_headsign"
        case pickupType = "pickup_type"
        case dropOffType = "drop_off_type"
        case shapeDistTraveled = "shape_dist_traveled"
        case timepoint = "timepoint"
    }
}


// trip_id                  (Required)
// arrival_time             (Optional) - Actually required but can be empty
// departure_time           (Optional) - Actually required but can be empty
// stop_id                  (Required)
// stop_sequence            (Required)
// stop_headsign            (Optional)
// pickup_type              (Optional)
// drop_off_type            (Optional)
// shape_dist_traveled      (Optional)
// timepoint                (Optional)
