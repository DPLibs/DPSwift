import Foundation

/// Protocol for print log in console.
///
public protocol DPLoggable {
    
    /// If `talse` all methods logging not printing.
    ///
    var loggingEnabled: Bool { get }
    
    /// Printing `items` by `print()`.
    /// - Parameter items: Sequence of items for printing.
    ///
    func logging(_ items: Any...)
}

// MARK: - DPLoggable + Default
public extension DPLoggable {
    
    var loggingEnabled: Bool {
        true
    }
    
    func logging(_ items: Any...) {
        guard self.loggingEnabled else { return }
        var itemsPrint: [String] = ["[\(NSStringFromClass(Self.self as? AnyClass ?? NSObject.self).components(separatedBy: ".").last ?? "")] - "]
        itemsPrint.append(contentsOf: items.map({ "\($0)" }))
        print(itemsPrint.joined(separator: " "))
    }
    
}
