import Foundation

class RewardViewModel : ObservableObject, Identifiable {
    let id: Int
    let date: Date
    let amount: Double
    let signingNodeName: String?
    
    init(id: Int, date: Date, amount: Double, signingNodeName: String?) {
        self.id = id
        self.date = date
        self.amount = amount
        self.signingNodeName = signingNodeName
    }
}
