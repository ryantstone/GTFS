import Foundation

public struct Transfer: Codable, Equatable, Hashable {
    public let fromStopId: String
    public let toStopId: String
    public let transferType: TransferType
    public let minTransferTime: Int?
    
    public var toStop: Stop? = nil
    public var fromStop: Stop? = nil
    
    private enum CodingKeys: String, CodingKey {
        case fromStopId = "from_stop_id",
        toStopId = "to_stop_id",
        transferType = "transfer_type",
        minTransferTime = "min_transfer_time"
    }
}

extension Transfer {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.fromStopId = try container.decode(String.self, forKey: .fromStopId)
        self.toStopId = try container.decode(String.self, forKey: .toStopId)
        self.minTransferTime = { try? container.decode(String.self, forKey: .minTransferTime) }()
            .flatMap(Int.init)
        
        if let transferType = { try? container.decode(String.self, forKey: .transferType) }()
            .flatMap(Int.init)
            .flatMap(TransferType.init) {
            self.transferType = transferType
        } else {
            throw DecodingError.typeMismatch(
                TransferType.self,
                DecodingError.Context.init(codingPath: [CodingKeys.transferType],
                                           debugDescription: "Failed to convert type to transfer type"))
            

        }
    }
}
