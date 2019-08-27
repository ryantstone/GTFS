import Foundation

public struct Shape: Codable, Equatable, Hashable {
    public let shapeId: String
    public let lat: Double
    public let lon: Double
    public let sequence: Int
    public let distanceTraveled: Double?
    
    public var trip: Trip? = nil
    
    enum CodingKeys: String, CodingKey {
        case shapeId = "shape_id"
        case lat = "shape_pt_lat"
        case lon = "shape_pt_lon"
        case sequence = "shape_pt_sequence"
        case distanceTraveled = "shape_dist_traveled"
    }
}

extension Shape {
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.shapeId = try container.decode(String.self, forKey: .shapeId)
        guard let latText = try? container.decode(String.self, forKey: .lat),
            let lat = Double(latText)  else {
                throw DecodingError.typeMismatch(
                    Double.self,
                    DecodingError.Context(codingPath: [CodingKeys.lat],
                                          debugDescription: "Failed to convert lat")
                )
                
        }
        self.lat = lat
        
        guard let lonText = try? container.decode(String.self, forKey: .lon),
            let lon = Double(lonText)  else {
                throw DecodingError.typeMismatch(
                    Double.self,
                    DecodingError.Context(codingPath: [CodingKeys.lon],
                                          debugDescription: "Failed to convert lon")
                )
                
        }
        self.lon = lon
        
        guard let sequenceText = try? container.decode(String.self, forKey: .sequence),
            let sequence = Int(sequenceText) else {
                throw DecodingError.typeMismatch(
                    Int.self,
                    DecodingError.Context(codingPath: [CodingKeys.sequence],
                                          debugDescription: "Failed to convert sequence")
                )
        }
        self.sequence = sequence
        
        self.distanceTraveled = { try? container.decode(String.self, forKey: .distanceTraveled) }()
            .flatMap(Double.init)
    }
}
