import CoreData
import Foundation

class CoreDataWallet: Wallet {
    var address: String? {
        get {
            let context = self.persistentContainer.viewContext

            let fetchRequest = NSFetchRequest<WalletEntity>(entityName: "WalletEntity")

            return try! context.fetch(fetchRequest).first?.address ?? nil
        }
        set {
            let context = self.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<WalletEntity>(entityName: "WalletEntity")
            guard let entity = try! context.fetch(fetchRequest).first else {
                let entity = WalletEntity(context: context)
                entity.address = newValue
                
                self.persistentContainer.saveContext()
                
                return
            }
            
            entity.address = newValue
            
            self.persistentContainer.saveContext()
        }
    }
    
    private let persistentContainer: NSPersistentContainer
    
    init(persistentContainer: NSPersistentContainer) {
        self.persistentContainer = persistentContainer
    }
}
