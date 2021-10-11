import Foundation

public extension Encodable {
    
    // MARK: - Dictionary
    
    /// Encode encodable to dictionary [String: Any] or nil.
    /// - Returns: dictionary of [String: Any] or nil.
    ///
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
    
    /// Encode encodable to dictionary [String: String] or nil.
    /// - Returns: dictionary of [String: String] or nil.
    ///
    var dictionaryOfStrings: [String: String]? {
        guard let dictionary = self.dictionary else { return nil }
        var result: [String: String] = [:]
        dictionary.forEach({ result[$0.key] = ($0.value as AnyObject).description })
        return result
    }
    
}
