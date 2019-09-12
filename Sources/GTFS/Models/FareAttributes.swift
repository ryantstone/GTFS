import Foundation

public enum PaymentMethod: Int, Codable, Hashable {
    case payOnBoard = 0,
         payBeforeBoard

}

public enum TransferType: Int, Codable, Hashable, Equatable {
    case noTransfer = 0,
        oneTransfer,
        twoTransfers,
        unlimitedTransfers
}

public struct FareAttributes: Codable, Hashable, Equatable {
    public let fareId: String
    public let price: Double
    public let currencyType: String
    public let paymentMethod: PaymentMethod
    public let transfers: TransferType
    public let agencyId: String?
    public let transferDuration: Int?
    
    public var fareRules = Set<FareRules>()

    fileprivate enum CodingKeys: String, CodingKey {
        case
            fareId = "fare_id",
            price = "price",
            currencyType = "currency_type",
            paymentMethod = "payment_method",
            transfers = "transfers",
            agencyId = "agency_id",
            transferDuration = "transfer_duration"
    }
}

extension FareAttributes {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.fareId             = try container.decode(String.self, forKey: .fareId)
        self.currencyType       = try container.decode(String.self, forKey: .currencyType)
        self.agencyId           = try? container.decode(String.self, forKey: .agencyId)
        self.transferDuration   = try container.decode(Int.self, forKey: .transferDuration)
        self.price              = try container.decode(Double.self, forKey: .price)
        self.paymentMethod      = try container.decode(PaymentMethod.self, forKey: .paymentMethod)
        self.transfers          = try container.decode(TransferType.self, forKey: .transfers)

    }
}
