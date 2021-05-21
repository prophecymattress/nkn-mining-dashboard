import Foundation

class AddNodeViewModel : ObservableObject {
    @Published var name: String = ""
    @Published var ipAddress: String = ""
    
    private let nodeApi: NodeApi
    private let nodeRepository: NodeRepository
    
    init(nodeApi: NodeApi, nodeRepository: NodeRepository) {
        self.nodeApi = nodeApi
        self.nodeRepository = nodeRepository
    }
    
    func tryAdd(completion: @escaping (Bool) -> Void) {
        // TODO: Consider using Result instead of Bool
        self.nodeApi.getNodeState(self.ipAddress) { response in
            guard let response = response else {
                completion(false)
                return
            }
            
            self.nodeRepository.add(
                Node(
                    name: self.name,
                    ipAddress: self.ipAddress,
                    publicKey: response.publicKey))
            
            completion(true)
        }
    }
}
