import Foundation

public extension Dictionary where Key == AnyHashable {
    
    /// Кeturns a string value by key or nil.
    /// - Parameter key: Key of value.
    /// - Returns: String value.
    ///
    func stringValue(_ key: String) -> String? {
        self[key] as? String
    }
    
}
