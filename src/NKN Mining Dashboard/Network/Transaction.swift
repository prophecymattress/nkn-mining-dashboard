import Foundation

struct Transaction : Decodable {
    let id: Int
    let txType: String // TODO: Enum
    let created_at: Date
    let payload: TransactionPayload
}

struct TransactionPayload : Decodable {
    let amount: Int
    let signerPk: String?
}
