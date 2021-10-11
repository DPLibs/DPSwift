import Foundation

/// Typealias for handler key type.
///
public typealias HandlerKey = NSObject

/// Typealias for handler type.
///
public typealias HandlerType<Input, Output> = (Input) -> Output

/// Сlass for creating and managing a list of closures.
///
public class Handlers<HandlerType> {
    
    // MARK: - Props
    
    /// List of closures.
    ///
    private var handlers: [HandlerKey: HandlerType] = [:]
    
    // MARK: - Init
    public init() {}
    
    // MARK: - Public methods
    
    /// Append handler in list.
    /// - Parameter handler - Handler for append.
    ///
    public func append(_ handler: HandlerType) -> HandlerKey {
        let key = HandlerKey()
        self.handlers[key] = handler
        return key
    }
    
    /// Remove handler from list.
    /// - Parameter key - Handler key.
    ///
    public func remove(_ key: HandlerKey) {
        self.handlers.removeValue(forKey: key)
    }
    
    /// Remove all closures.
    ///
    public func removeAll() {
        self.handlers.removeAll()
    }
    
    /// Execute all closures from list.
    /// - Parameter execution - Returns the key and closure.
    ///
    public func execute(_ execution: ((HandlerKey, HandlerType) -> Void)?) {
        self.handlers.forEach({ key, handler in
            execution?(key, handler)
        })
    }
}



