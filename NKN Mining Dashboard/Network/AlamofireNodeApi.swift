import Alamofire
import Foundation

class AlamofireNodeApi: NodeApi {
    func getNodeState(_ ipAddress: String, completion: @escaping (NodeStateResponseBody?) -> Void) {
        let url = "http://\(ipAddress):30003/jsonrpc"
        
        AF
            .request(url, method: .post, parameters: NodeStateRequest(), encoder: JSONParameterEncoder.default)
            .responseDecodable(of: NodeStateResponse.self) { result in
                guard let nodeStateResponse = result.value else {
                    completion(nil)
                    
                    return
                }
                
                completion(nodeStateResponse.result)
            }
    }
}
