import Foundation

class InMemoryNodeRepository: NodeRepository {
    var nodes = [
        Node(name: "UK South", ipAddress: "51.140.46.148", publicKey: "73c1b3c4fa4ebf5c847d803efd742683ebb27355514d3f2d85ed50bf02f9f2eb"),
        Node(name: "Europe West", ipAddress: "40.118.20.42", publicKey: "6cad414ec85474689cccddf079433b3bd1709356511f9d5fa8addeb118ab878d"),
        Node(name: "US East", ipAddress: "52.255.181.48", publicKey: "e40816e7d134946ee6c518ca6650ea48341614845a73e23edd499030a4345a0a"),
        Node(name: "US West", ipAddress: "52.247.223.212", publicKey: "")
    ]
    
    func add(_ node: Node) {
        self.nodes.append(node)
    }
    
    func getAll() -> [Node] {
        return self.nodes
    }
    
    func getBy(publicKey: String) -> Node? {
        return nodes.first { $0.publicKey == publicKey }
    }
}
