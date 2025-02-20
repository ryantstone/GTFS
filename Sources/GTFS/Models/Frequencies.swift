import Foundation

public struct Frequencies: Equatable, Codable, Hashable {
    public let tripId: String
    public let startTime: String
    public let endTime: String
    public let headwaySeconds: Double
    public let exactTimes: TripType?

    weak public var trip: Trip? = nil
    
    public enum TripType: Int, Equatable, Hashable, Codable {
        case frequency, scheduled
    }

    enum CodingKeys: String, CodingKey {
        case tripId         = "trip_id"
        case startTime      = "start_time"
        case endTime        = "end_time"
        case headwaySeconds = "headway_secs"
        case exactTimes     = "exact_times"
    }
}

//extension Frequencies {
//    public init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//
//        self.tripId         = try container.decode(String.self, forKey: .tripId)
//        self.startTime      = try container.decode(String.self, forKey: .startTime)
//        self.endTime        = try container.decode(String.self, forKey: .endTime)
//        self.headwaySeconds = try container.decode(Double.self, forKey: .headwaySeconds)
//        self.exactTimes     = try container.decode(TripType.self, forKey: .exactTimes)
//    }
//}
