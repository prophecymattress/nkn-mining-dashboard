import Foundation

struct TransactionsResponse : Decodable {
    let data: [Transaction]
}
