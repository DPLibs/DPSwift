import Foundation

/// Protocol for print log in console.
///
public protocol DPLoggable {
    
    /// If `talse` all methods logging not printing.
    ///
    static var isLoggableEnabled: Bool { get }
    
    /// Printing `items` and `method (#function)` by `print()`.
    /// - Parameter items: Sequence of items for printing.
    ///
    static func log(method: String?, _ items: Any...)
    
    static func log(_ items: Any...)
    static func logError(method: String?, _ error: Error?)
    static func logError(_ error: Error?)
}

public extension DPLoggable {
    
    static var isLoggableEnabled: Bool {
        true
    }
    
    static func log(method: String?, _ items: Any...) {
        guard self.isLoggableEnabled else { return }
        
        let className = String(describing: Self.self)
        var printItems: [String] = ["[\(className)]"]
        
        if let method = method {
            printItems += ["[\(method)]"]
        }
        
        printItems += items.map({ "\($0)" })
        print(printItems.joined(separator: " - "))
    }
    
    static func log(_ items: Any...) {
        self.log(method: nil, items)
    }
    
    static func logError(method: String?, _ error: Error?) {
        guard let error = error else { return }
        self.log(method: method, "error: \(error.localizedDescription)")
    }
    
    static func logError(_ error: Error?) {
        self.logError(method: nil, error)
    }
    
}
