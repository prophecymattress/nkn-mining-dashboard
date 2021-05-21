import Foundation

protocol NodeApi {
    func getNodeState(_ ipAddress: String, completion: @escaping (NodeStateResponseBody?) -> Void)
}
