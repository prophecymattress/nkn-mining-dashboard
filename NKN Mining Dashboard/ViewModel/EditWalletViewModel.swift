import Foundation

// TODO: Could this whole type be replaced by a property wrapper?
class EditWalletViewModel: ObservableObject {
    @Published var address: String
    
    private var wallet: Wallet
    
    init(wallet: Wallet) {
        self.wallet = wallet
        self.address = self.wallet.address ?? ""
    }
    
    func save() {
        self.wallet.address = self.address
    }
}
