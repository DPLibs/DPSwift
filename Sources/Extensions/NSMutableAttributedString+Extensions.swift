import Foundation

public extension NSMutableAttributedString {
    
    // MARK: - Create methods
    
    /// Create mutableAttributedString from list of NSAttributedString.
    /// - Parameter attributedStrings: List of attributed strings for add.
    /// - Returns: Created mutableAttributedString.
    ///
    static func createFromAttributedStrings(_ attributedStrings: [NSAttributedString]) -> NSMutableAttributedString {
        let string = NSMutableAttributedString()
        attributedStrings.forEach({ string.append($0) })
        return string
    }
    
}
