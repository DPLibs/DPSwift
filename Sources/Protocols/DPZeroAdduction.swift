import Foundation

/// Protocol for converting to `zero` for `Self`.
///
public protocol DPZeroAdduction {
    
    /// Returns `zero` for `Self`.
    ///
    static var zero: Self { get }
}
