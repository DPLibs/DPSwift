import Foundation

/// Protocol for time structs adduction.
///
public protocol TimeStructAdduction {
    
    /// Returns `Date`.
    ///
    var toDate: Date { get }
    
    /// Returns `TimeStamp`.
    ///
    var toTimeStamp: TimeStamp { get }
    
    /// Returns `TimeUnit`.
    ///
    var toTimeUnit: TimeUnit { get }
}
