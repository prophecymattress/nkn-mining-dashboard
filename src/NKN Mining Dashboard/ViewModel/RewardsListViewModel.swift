import Alamofire
import Foundation

class RewardsListViewModel : ObservableObject {
    @Published var rewards: [RewardViewModel] = []
    
    private let nodeRepository: NodeRepository
    private let nknApi: NknAPi
    private let wallet: Wallet
    
    init(nodeRepository: NodeRepository, nknApi: NknAPi, wallet: Wallet) {
        self.nodeRepository = nodeRepository
        self.nknApi = nknApi
        self.wallet = wallet
    }
    
    public func refresh() {
        guard let address = self.wallet.address, !address.isEmpty else {
            return
        }
        
        self.nknApi.getTransactions(for: address) { transactions in
            self.rewards = transactions
                .filter { transaction in
                    transaction.txType == "COINBASE_TYPE"
                }
                .map { transaction in
                    RewardViewModel(
                        id: transaction.id,
                        date: transaction.created_at,
                        amount: Double(transaction.payload.amount) / 100000000.0,
                        signingNodeName: self.getSignerNodeNode(signerPublicKey: transaction.payload.signerPk))
                }
        }
    }
    
    private func getSignerNodeNode(signerPublicKey: String?) -> String? {
        guard let signerPublicKey = signerPublicKey else {
            return nil
        }
        
        return self.nodeRepository.getBy(publicKey: signerPublicKey)?.name ?? "Unknown Node"
    }
}
