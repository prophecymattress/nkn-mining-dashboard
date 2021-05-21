import Foundation

protocol NodeRepository {
    func add(_ node: Node)
    func getAll() -> [Node]
    func getBy(publicKey: String) -> Node?
}
