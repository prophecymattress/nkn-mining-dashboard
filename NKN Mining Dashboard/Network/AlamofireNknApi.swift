import Alamofire
import Foundation

class AlamofireNknApi: NknAPi {
    func getTransactions(
        for walletAddress: String,
        completion: @escaping ([Transaction]) -> Void) {
        let url = "https://openapi.nkn.org/api/v1/addresses/\(walletAddress)/transactions"
        
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        AF
            .request(url, method: .get)
            .responseDecodable(of: TransactionsResponse.self, decoder: decoder) { result in
                guard let transactionsResponse = result.value else {
                    completion([])
                    
                    return
                }
                
                completion(transactionsResponse.data)
            }
    }
}
