import Foundation

protocol NknAPi {
    func getTransactions(for walletAddress: String, completion: @escaping ([Transaction]) -> Void)
}
