import Foundation

public extension Collection {
    
    // MARK: - Methods for elements
    
    /// Return element at index.
    /// - Parameter index: Index of element.
    /// - Returns: Element at index or nil.
    ///
    func element(at index: Index) -> Element? {
        self.indices.contains(index) ? self[index] : nil
    }
    
    
    
}
