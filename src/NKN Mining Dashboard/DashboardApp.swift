import CoreData
import Dip
import SwiftUI

@main
struct DashboardApp: App {
    static var container: DependencyContainer = DependencyContainer()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    init() {
        let container = DependencyContainer()
        
        container.register(.singleton) { () -> NSPersistentContainer in
            let container = NSPersistentContainer(name: "Model")
            container.loadPersistentStores { _, error in
              if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
              }
            }
            
            return container
        }
        
        container.register(.singleton) {
            CoreDataNodeRepository(persistentContainer: try! container.resolve()) as NodeRepository
        }
        
        container.register(.singleton) {
            CoreDataWallet(persistentContainer: try! container.resolve()) as Wallet
        }
        
        container.register(.singleton) { AlamofireNknApi() as NknAPi }
        container.register(.singleton) { AlamofireNodeApi() as NodeApi }
        
        container.register(.singleton) { NodeViewModelFactory(
            nodeApi: try! container.resolve())
        }
        
        container.register { AddNodeViewModel(
            nodeApi: try! container.resolve(),
            nodeRepository: try! container.resolve())
        }
        
        container.register { EditWalletViewModel(wallet: try! container.resolve()) }
        
        container.register(.singleton) { NodeListViewModel(
            nodeRepository: try! container.resolve(),
            nodeViewModelFactory: try! container.resolve())
        }
        
        container.register(.singleton) { RewardsListViewModel(
            nodeRepository: try! container.resolve(),
            nknApi: try! container.resolve(),
            wallet: try! container.resolve())
        }
        
        DashboardApp.container = container
    }
}
