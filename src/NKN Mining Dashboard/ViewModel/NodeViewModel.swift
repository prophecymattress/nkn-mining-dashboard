import Alamofire
import Foundation

class NodeViewModel: Identifiable, ObservableObject {
    let id: UUID
    @Published var name: String
    @Published var ipAddress: String
    @Published var miningStatusEmoji: String
    
    private let nodeApi: NodeApi
    
    init(name: String, ipAddress: String, nodeApi: NodeApi) {
        self.name = name
        self.ipAddress = ipAddress
        self.id = UUID()
        self.miningStatusEmoji = "?"    // TODO: Enum
        self.nodeApi = nodeApi
    }
    
    func refresh() {
        self.nodeApi.getNodeState(self.ipAddress) { responseBody in
            guard let nodeStateResponse = responseBody else {
                self.miningStatusEmoji = "❌"
                
                return
            }
            
            self.miningStatusEmoji = nodeStateResponse.syncState == "PERSIST_FINISHED"
                ? "⛏"
                : "❌"
        }
    }
}
