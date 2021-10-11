import Foundation
import KeychainSwift

/// Struct for defining the stored parameter with generic type `ParameterType`.
/// Availible types for `ParameterType`: `String`, `Int`, `Double`, `Float`, `Bool`, `Data`.
///
public struct DPStoredParameter<ParameterType: Any> {
    
    // MARK: - Static
    
    /// Struct for defining the store type.
    ///
    public enum Store {
        
        /// Stored in `UserDefaults`.
        ///
        case UserDefaults
        
        /// Stored in `Keychain`.
        ///
        case Keychain
    }
    
    public static func create(_ name: String, store: Store) -> DPStoredParameter<ParameterType> {
        .init(name, store: store)
    }
    
    // MARK: - Props
    
    /// Prefix for keychain key. Default: `"\(Bundle.main.bundleIdentifier ?? "")_keychain_"`.
    ///
    public let keychainKeyPrefix: String
    
    /// Parameter stored name.
    ///
    public let name: String
    
    /// Parameter stored key. Default: `"stored_parameter_\(name)"`.
    ///
    public let key: String
    
    /// Store type.
    ///
    public let store: Store
    
    // MARK: - Init
    
    /// Default initialize.
    /// - Parameter name - Parameter stored name.
    /// - Parameter store - Store type.
    ///
    public init(_ name: String, store: Store) {
        self.keychainKeyPrefix = "\(Bundle.main.bundleIdentifier ?? "")_keychain_"
        self.name = name
        self.key = "stored_parameter_\(name)"
        self.store = store
    }
    
    // MARK: - Public methods
    
    /// Set paramter value.
    /// - Parameter value - Parameter value.
    ///
    public func set(_ value: ParameterType) {
        switch self.store {
        case .UserDefaults:
            UserDefaults.standard.set(value, forKey: self.key)
        case .Keychain:
            self.setInKeychain(value)
        }
    }
    
    private func setInKeychain(_ value: ParameterType) {
        let keychain = KeychainSwift(keyPrefix: self.keychainKeyPrefix)
        
        switch value {
        case let string as String:
            keychain.set(string, forKey: self.key)
        case let int as Int:
            keychain.set(int.description, forKey: self.key)
        case let double as Double:
            keychain.set(double.description, forKey: self.key)
        case let float as Float:
            keychain.set(float.description, forKey: self.key)
        case let bool as Bool:
            keychain.set(bool, forKey: self.key)
        case let data as Data:
            keychain.set(data, forKey: self.key)
        default:
            break
        }
    }
    
    /// Get paramter value.
    /// - Returns: Paramter value or nil.
    ///
    public func get() -> ParameterType? {
        switch self.store {
        case .UserDefaults:
            return UserDefaults.standard.object(forKey: self.key) as? ParameterType
        case .Keychain:
            return self.getInKeychain()
        }
        
    }
    
    private func getInKeychain() -> ParameterType? {
        let keychain = KeychainSwift(keyPrefix: self.keychainKeyPrefix)
        let value: Any?
        
        switch ParameterType.self {
        case is String.Type:
            value = keychain.get(self.key)
        case is Int.Type:
            value = keychain.get(self.key)?.toInt
        case is Double.Type:
            value = keychain.get(self.key)?.toDouble
        case is Float.Type:
            value = keychain.get(self.key)?.toFloat
        case is Bool.Type:
            value = keychain.getBool(self.key)
        case is Data.Type:
            value = keychain.getData(self.key)
        default:
            value = nil
        }
        
        return value as? ParameterType
    }
    
    /// Remove paramter value.
    ///
    public func remove() {
        switch self.store {
        case .UserDefaults:
            UserDefaults.standard.removeObject(forKey: self.key)
        case .Keychain:
            KeychainSwift(keyPrefix: self.keychainKeyPrefix).delete(self.key)
        }
        
    }
}
