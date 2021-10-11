import Foundation

/// Enum for determining the application environment.
///
public enum Environment {
    
    /// Debug. *Current* will return *debug* when condition `#if DEBUG` is true.
    ///
    case debug
    
    /// TestFlight. `Current` will return `testFlight` when condition `#if DEBUG` is false and `Bundle.main.appStoreReceiptURL?.lastPathComponent == "sandboxReceipt"`.
    ///
    case testFlight
    
    /// Release. `Current` will return `release` when condition `#if DEBUG` is false and `Bundle.main.appStoreReceiptURL?.lastPathComponent != "sandboxReceipt"`.
    ///
    case release
    
    /// Returns current `Environment`.
    ///
    public static var current: Environment {
        #if DEBUG
        return .debug
        #else
        if Bundle.main.appStoreReceiptURL?.lastPathComponent == "sandboxReceipt" {
            return .testFlight
        } else {
            return .release
        }
        return Bundle.main.appStoreReceiptURL?.lastPathComponent == "sandboxReceipt" ? .testFlight : .release
        #endif
    }
}
