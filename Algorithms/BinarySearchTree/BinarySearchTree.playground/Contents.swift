
import UIKit
import PlaygroundSupport
import AlgorithmsTest



let tree = BinarySearchTree<Int>(value: 7)
tree.insert(value: 3)
tree.insert(value: 4)
tree.insert(value: 2)
tree.insert(value: 12)
tree.insert(value: 10)
tree.insert(value: 9)
tree.insert(value: 6)
tree.insert(value: 7)
print(tree)
tree.description
let toDelete = tree.search(value: 7)

toDelete?.remove()
