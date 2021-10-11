import Foundation

/// Protocol for converting to `Date`.
///
public protocol DateAdduction {
    
    /// Returns the date assuming that `Self` is in `seconds`.
    ///
    var toDateAsSeconds: Date { get }
    
    /// Returns the date assuming that `Self` is in `milliseconds`.
    ///
    var toDateAsMilliseconds: Date { get }
}

// MARK: - Int + DateAdduction
extension Int: DateAdduction {
    
    public var toDateAsSeconds: Date {
        .init(timeIntervalSince1970: self.toTimeInterval)
    }
    
    public var toDateAsMilliseconds: Date {
        .init(timeIntervalSince1970: self.toTimeInterval)
    }
    
}

// MARK: - Double + DateAdduction
extension Double: DateAdduction {
    
    public var toDateAsSeconds: Date {
        .init(timeIntervalSince1970: self.toTimeInterval)
    }
    
    public var toDateAsMilliseconds: Date {
        .init(timeIntervalSince1970: self.toTimeInterval)
    }
    
}

// MARK: - Float + DateAdduction
extension Float: DateAdduction {
    
    public var toDateAsSeconds: Date {
        .init(timeIntervalSince1970: self.toTimeInterval)
    }
    
    public var toDateAsMilliseconds: Date {
        .init(timeIntervalSince1970: self.toTimeInterval)
    }
    
}

// MARK: - CGFloat + DateAdduction
extension CGFloat: DateAdduction {
    
    public var toDateAsSeconds: Date {
        .init(timeIntervalSince1970: self.toTimeInterval)
    }
    
    public var toDateAsMilliseconds: Date {
        .init(timeIntervalSince1970: self.toTimeInterval)
    }
    
}

// MARK: - NSNumber + DateAdduction
extension NSNumber: DateAdduction {
    
    public var toDateAsSeconds: Date {
        .init(timeIntervalSince1970: self.toTimeInterval)
    }
    
    public var toDateAsMilliseconds: Date {
        .init(timeIntervalSince1970: self.toTimeInterval)
    }
    
}
