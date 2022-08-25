import Foundation
import UIKit

/// Protocol for converting to `Date`.
///
public protocol DPDateAdduction {
    
    /// Returns the date assuming that `Self` is in `seconds`.
    ///
    var toDateAsSeconds: Date { get }
    
    /// Returns the date assuming that `Self` is in `milliseconds`.
    ///
    var toDateAsMilliseconds: Date { get }
}

// MARK: - Int + DPDateAdduction
extension Int: DPDateAdduction {
    
    public var toDateAsSeconds: Date {
        .init(timeIntervalSince1970: self.toTimeInterval)
    }
    
    public var toDateAsMilliseconds: Date {
        .init(timeIntervalSince1970: self.toTimeInterval)
    }
    
}

// MARK: - Double + DPDateAdduction
extension Double: DPDateAdduction {
    
    public var toDateAsSeconds: Date {
        .init(timeIntervalSince1970: self.toTimeInterval)
    }
    
    public var toDateAsMilliseconds: Date {
        .init(timeIntervalSince1970: self.toTimeInterval)
    }
    
}

// MARK: - Float + DPDateAdduction
extension Float: DPDateAdduction {
    
    public var toDateAsSeconds: Date {
        .init(timeIntervalSince1970: self.toTimeInterval)
    }
    
    public var toDateAsMilliseconds: Date {
        .init(timeIntervalSince1970: self.toTimeInterval)
    }
    
}

// MARK: - CGFloat + DPDateAdduction
extension CGFloat: DPDateAdduction {
    
    public var toDateAsSeconds: Date {
        .init(timeIntervalSince1970: self.toTimeInterval)
    }
    
    public var toDateAsMilliseconds: Date {
        .init(timeIntervalSince1970: self.toTimeInterval)
    }
    
}

// MARK: - NSNumber + DPDateAdduction
extension NSNumber: DPDateAdduction {
    
    public var toDateAsSeconds: Date {
        .init(timeIntervalSince1970: self.toTimeInterval)
    }
    
    public var toDateAsMilliseconds: Date {
        .init(timeIntervalSince1970: self.toTimeInterval)
    }
    
}
