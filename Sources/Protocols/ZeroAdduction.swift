import Foundation

/// Protocol for converting to `zero` for `Self`.
///
public protocol ZeroAdduction {
    
    /// Returns `zero` for `Self`.
    ///
    static var zero: Self { get }
}
