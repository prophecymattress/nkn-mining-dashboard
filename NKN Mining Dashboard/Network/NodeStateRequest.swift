import Foundation

struct NodeStateRequest : Encodable {
    let jsonrpc = "2.0"
    let id: Int = 1
    let method = "getnodestate"
    let params = Empty()
}
