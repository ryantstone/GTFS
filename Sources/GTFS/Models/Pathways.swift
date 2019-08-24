import Foundation

public enum PathwayMode: Int {
    case walkway = 0,
        stairs,
        movingSidewalk,
        escalator,
        elevator,
        fareGate,
        exitGate
}

public struct Pathways {
    public let pathwayId: String
    public let fromStopId: String
    public let toStopId: String
    public let pathwayMode: PathwayMode
    public let isBidirectional: Bool
    public let length: Double?
    public let traversalTime: Int?
    public let stairCount: Int?
    public let maxSlope: Double?
    public let minWidth: Double?
    public let signpostedAs: String?
    public let reverseSignpostedAs: String?

    private enum CodingKeys: String, CodingKey {
        case pathwayId = "pathway_id",
        fromStopId = "from_stop_id",
        toStopId = "to_stop_id",
        pathwayMode = "pathway_mode",
        isBidirectional = "is_bidirectional",
        length = "length",
        traversalTime = "traversal_time",
        stairCount = "stair_count",
        maxSlope = "max_slope",
        minWidth = "min_width",
        signpostedAs = "signposted_as",
        reverseSignpostedAs = "reverse_signposted_as"
    }

}

extension Pathways {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.pathwayId              = try container.decode(String.self, forKey: .pathwayId)
        self.fromStopId             = try container.decode(String.self, forKey: .fromStopId)
        self.toStopId               = try container.decode(String.self, forKey: .toStopId)
        self.signpostedAs           = try? container.decode(String.self, forKey: .signpostedAs)
        self.reverseSignpostedAs    = try? container.decode(String.self, forKey: .reverseSignpostedAs)

        if let pathway = { try? container.decode(String.self, forKey: .pathwayMode) }()
            .flatMap(Int.init)
            .flatMap(PathwayMode.init) {
            self.pathwayMode = pathway
        } else {
            throw DecodingError.typeMismatch(PathwayMode.self, DecodingError.Context.init(codingPath: [CodingKeys.pathwayMode], debugDescription: "Failed to convert type to pathway mode"))
        }

        //pathway mode
        if let bidirectional = { try? container.decode(String.self, forKey: .isBidirectional) }().flatMap(Bool.init) {
            self.isBidirectional = bidirectional
        } else {
            throw DecodingError.typeMismatch(Bool.self, DecodingError.Context.init(codingPath: [CodingKeys.isBidirectional], debugDescription: "Failed to convert type to Bool"))
        }

        self.length = { try? container.decode(String.self, forKey: .length) }()
            .flatMap(Double.init)

        self.traversalTime = { try? container.decode(String.self, forKey: .traversalTime) }()
            .flatMap(Int.init)

        self.stairCount = { try? container.decode(String.self, forKey: .stairCount) }()
            .flatMap(Int.init)

        self.maxSlope = { try? container.decode(String.self, forKey: .maxSlope) }()
            .flatMap(Double.init)

        self.minWidth = { try? container.decode(String.self, forKey: .minWidth)}()
            .flatMap(Double.init)
    }

}
