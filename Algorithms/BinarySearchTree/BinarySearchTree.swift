
public class BinarySearchTree<T: Comparable> {
    
    fileprivate(set) public var value: T
    fileprivate(set) public var parent: BinarySearchTree?
    fileprivate(set) public var left: BinarySearchTree?
    fileprivate(set) public var right: BinarySearchTree?
    
    public init(value: T) {
        self.value = value
    }
    
    public var isRoot: Bool {
        return self.parent == nil
    }
    
    public var isLeaf: Bool {
        return self.left == nil && self.right == nil
    }
    
    public var isLeftChild: Bool {
        return parent?.left === self
    }
    
    public var isRightChild: Bool {
        return parent?.right === self
    }
    
    public var hasLeftChild: Bool {
        return left != nil
    }
    
    public var hasRightChild: Bool {
        return right != nil
    }
    
    public var hasAnyChild: Bool {
        return hasLeftChild || hasRightChild
    }
    
    public var hasBothChildren: Bool {
        return hasRightChild && hasRightChild
    }
    
    public var count: Int {
        return 1 + (left?.count ?? 0) + (right?.count ?? 0)
    }
    
    public var height: Int {
        if isLeaf {
            return 0
        } else {
            return 1 + max(left?.count ?? 0, right?.count ?? 0)
        }
    }
}

extension BinarySearchTree {
    // insert
    public func insert(value: T) {
        if value < self.value {
            if let left = left {
                left.insert(value: value)
            } else {
                left = BinarySearchTree(value: value)
                left?.parent = self
            }
        } else {
            if let right = right {
                right.insert(value: value)
            } else {
                right = BinarySearchTree(value: value)
                right?.parent = self
            }
        }
    }
    
    // search
    public func search(value: T) -> BinarySearchTree? {
        if value < self.value {
            if let left = left {
                return left.search(value: value)
            } else {
                return nil
            }
        } else if value > self.value {
            if let right = right {
                return right.search(value: value)
            } else {
                return nil
            }
        } else {
            return self
        }
    }
    
    // minimum tree
    public func minimum() -> BinarySearchTree {
        var node = self
        while let next = node.left {
            node = next
        }
        return node
    }
    
    // maximum tree
    public func maximum() -> BinarySearchTree {
        var node = self
        while let next = node.right {
            node = next
        }
        return node
    }
    
    @discardableResult public func remove() -> BinarySearchTree? {
        let replacement: BinarySearchTree?
        
        if let right = right {
            replacement = right.minimum()
        } else if let left = left {
            replacement = left.minimum()
        } else {
            replacement = nil
        }
        
        replacement?.remove()
        
        replacement?.right = right
        replacement?.left = left
        
        parent?.right = replacement
        parent?.left = replacement
        reconnectParentTo(replacement: replacement)
        
        parent = nil
        left = nil
        right = nil
        
        return replacement
    }
    
    fileprivate func reconnectParentTo(replacement: BinarySearchTree?) {
        if let parent = parent {
            if parent.hasLeftChild {
                parent.left = replacement
            } else {
                parent.right = replacement
            }
        }
        replacement?.parent = parent
    }
}

extension BinarySearchTree: CustomStringConvertible {
    public var description: String {
        var s = ""
        if let left = left {
            s += "(\(left.description)) <- "
        }
        s += "\(value)"
        if let right = right {
            s += " -> (\(right.description))"
        }
        return s
    }
}
