import Foundation

class NodeListViewModel : ObservableObject {
    @Published var nodes: [NodeViewModel] = []
    
    private let nodeRepository: NodeRepository
    private let nodeViewModelFactory: NodeViewModelFactory
    
    init(nodeRepository: NodeRepository, nodeViewModelFactory: NodeViewModelFactory) {
        self.nodeRepository = nodeRepository
        self.nodeViewModelFactory = nodeViewModelFactory
    }
    
    public func refresh() {
        print("Refreshing")
        self.nodes = self.nodeRepository.getAll().map { node in
            self.nodeViewModelFactory.create(
                name: node.name,
                ipAddress: node.ipAddress)
        }
        
        self.nodes.forEach { node in node.refresh() }
    }
}
