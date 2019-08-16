import Foundation

public enum PaymentMethod: Int, Codable {
    case payOnBoard = 0,
         payBeforeBoard

}

public enum TransferType: Int, Codable {
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
        self.transferDuration   = { try? container.decode(String.self, forKey: .transferDuration) }().flatMap(Int.init)

        guard let price = { try? container.decode(String.self, forKey: .price) }().flatMap(Double.init) else {
            throw DecodingError.typeMismatch(
                Double.self,
                DecodingError.Context.init(codingPath: [CodingKeys.price],
                                           debugDescription: "Failed to convert type to price"))

        }
        self.price = price

        guard let paymentMethod = { try? container.decode(String.self, forKey: .paymentMethod) }()
            .flatMap(Int.init)
            .flatMap(PaymentMethod.init) else {

                throw DecodingError.typeMismatch(
                    PaymentMethod.self,
                    DecodingError.Context.init(codingPath: [CodingKeys.paymentMethod],
                                               debugDescription: "Failed to convert type to payment method"))
        }
        self.paymentMethod = paymentMethod

        guard let transfers = { try? container.decode(String.self, forKey: .transfers) }()
            .flatMap(Int.init)
            .flatMap(TransferType.init) else {

                throw DecodingError.typeMismatch(
                    TransferType.self,
                    DecodingError.Context.init(codingPath: [CodingKeys.transfers],
                                               debugDescription: "Failed to convert type to transfers"))
        }

        self.transfers = transfers
    }
}
