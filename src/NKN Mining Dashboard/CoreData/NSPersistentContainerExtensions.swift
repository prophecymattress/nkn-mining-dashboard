import CoreData
import Foundation

extension NSPersistentContainer {
    func saveContext() {
        if (self.viewContext.hasChanges) {
            do {
                try self.viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
