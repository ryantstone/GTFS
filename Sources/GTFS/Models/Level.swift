import Foundation

public struct Level: Codable, Equatable {
    public let levelId: String
    public let levelIndex: Double
    public let levelName: String
    
    private enum CodingKeys: String, CodingKey {
        case levelId = "level_id",
        levelIndex = "level_index",
        levelName = "level_name"
    }
}

extension Level {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.levelId = try container.decode(String.self, forKey: .levelId)
        self.levelIndex = try container.decode(Double.self, forKey: .levelIndex)
        self.levelName = try container.decode(String.self, forKey: .levelName)
    }
}
