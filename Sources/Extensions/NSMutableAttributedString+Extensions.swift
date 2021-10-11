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
    
    /// Create mutableAttributedString from string.
    /// - Parameter string: String for create.
    /// - Parameter styles: Styles for created mutableAttributedString.
    /// - Returns: Created mutableAttributedString with styles.
    ///
    static func createFromString(_ string: String, with styles: [StyleWrapper<NSMutableAttributedString>]) -> NSMutableAttributedString {
        let mutableAttributedString = NSMutableAttributedString(string: string)
        mutableAttributedString.apply(styles)
        return mutableAttributedString
    }
    
}
