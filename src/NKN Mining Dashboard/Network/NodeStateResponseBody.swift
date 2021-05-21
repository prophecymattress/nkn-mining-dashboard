import Foundation

// TODO: There's probably a better name for this
struct NodeStateResponseBody : Decodable {
    let syncState: String
    let publicKey: String
}
