import Foundation

/// Protocol allows you to create `Self` from the optional `rawValue` or return the default value.
///
public protocol CreateOrDefaultInitable {
    associatedtype RawValueType
    
    var rawValue: RawValueType { get }
    
    init?(rawValue: RawValueType)
    
    static var defaultValue: Self { get }
    
    static func createOrDefault(rawValue: RawValueType?) -> Self
}

public extension CreateOrDefaultInitable {
    
    static func createOrDefault(rawValue: RawValueType?) -> Self {
        self.init(rawValue: rawValue ?? self.defaultValue.rawValue) ?? self.defaultValue
    }
    
}
