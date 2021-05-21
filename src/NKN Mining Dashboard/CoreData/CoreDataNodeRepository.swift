import CoreData
import Foundation

class CoreDataNodeRepository : NodeRepository {
    private let persistentContainer: NSPersistentContainer
    
    init(persistentContainer: NSPersistentContainer) {
        self.persistentContainer = persistentContainer
    }
    
    func add(_ node: Node) {
        let context = self.persistentContainer.viewContext
        let entity = NodeEntity(context: context)
        entity.name = node.name
        entity.ipAddress = node.ipAddress
        entity.publicKey = node.publicKey
        
        self.persistentContainer.saveContext()
    }
    
    func getAll() -> [Node] {
        let context = self.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NodeEntity>(entityName: "NodeEntity")
        
        return try! context.fetch(fetchRequest).map { entity in
            Node(
                name: entity.name!,
                ipAddress: entity.ipAddress!,
                publicKey: entity.publicKey!
            )
        }
    }
    
    func getBy(publicKey: String) -> Node? {
        let context = self.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NodeEntity>(entityName: "NodeEntity")
        fetchRequest.predicate = NSPredicate(format: "publicKey == %@", publicKey)
        
        guard let entity = try! context.fetch(fetchRequest).first else {
            return nil
        }
    
        return Node(
            name: entity.name!, // TODO: Why are all of these optional?
            ipAddress: entity.ipAddress!,
            publicKey: entity.publicKey!)
    }
}
