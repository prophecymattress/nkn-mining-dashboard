import Foundation

class NodeViewModelFactory {
    private let nodeApi: NodeApi
    
    init(nodeApi: NodeApi) {
        self.nodeApi = nodeApi
    }
    
    func create(name: String, ipAddress: String) -> NodeViewModel {
        return NodeViewModel(name: name, ipAddress: ipAddress, nodeApi: self.nodeApi)
    }
}
