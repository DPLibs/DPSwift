import Foundation

/// Struct for determining the time interval unit.
///
public struct TimeUnit {
    
    // MARK: - Props
    
    /// Milliseconds value.
    ///
    public let milliseconds: Double
    
    /// Seconds value.
    ///
    public let seconds: Double
    
    /// Minutes value.
    ///
    public let minutes: Double
    
    /// Hours value.
    ///
    public let hours: Double
    
    // MARK: - Init
    
    /// Initialize  from milliseconds value.
    /// - Parameter milliseconds - Milliseconds value.
    ///
    public init(milliseconds: Double) {
        self.milliseconds = milliseconds
        self.seconds = milliseconds / 1000
        self.minutes = milliseconds / 1000 / 60
        self.hours = milliseconds / 1000 / 60 / 60
    }
    
    /// Initialize  from seconds value.
    /// - Parameter seconds - Seconds value.
    ///
    public init(seconds: Double) {
        self.init(milliseconds: seconds * 1000)
    }
    
    /// Initialize  from minutes value.
    /// - Parameter minutes - Minutes value.
    ///
    public init(minutes: Double) {
        self.init(milliseconds: minutes * 60 * 1000)
    }

    /// Initialize  from hours value.
    /// - Parameter hours - Hours value.
    ///
    public init(hours: Double) {
        self.init(milliseconds: hours * 60 * 60 * 1000)
    }
    
}

// MARK: - TimeUnit + Equatable
extension TimeUnit: Equatable {
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.milliseconds == rhs.milliseconds &&
        lhs.seconds == rhs.seconds &&
        lhs.minutes == rhs.minutes &&
        lhs.hours == rhs.hours
    }
    
}

// MARK: - TimeUnit + Comparable
extension TimeUnit: Comparable {
    
    public static func < (lhs: Self, rhs: Self) -> Bool {
        lhs.milliseconds < rhs.milliseconds &&
        lhs.seconds < rhs.seconds &&
        lhs.minutes < rhs.minutes &&
        lhs.hours < rhs.hours
    }
    
}

// MARK: - TimeUnit + TimeStructAdduction
extension TimeUnit: TimeStructAdduction {
    
    public var toDate: Date {
        .init(timeIntervalSince1970: self.seconds)
    }
    
    public var toTimeStamp: TimeStamp {
        .init(milliseconds: self.milliseconds)
    }
    
    public var toTimeUnit: TimeUnit {
        self
    }
    
}

// MARK: - TimeUnit + MathProtocol
extension TimeUnit: ZeroAdduction {
    
    static public var zero: TimeUnit {
        .init(milliseconds: .zero)
    }
    
}

// MARK: - TimeUnit + Mathematical
extension TimeUnit: Mathematical {
    
    prefix public static func - (x: Self) -> Self {
        .init(milliseconds: -x.milliseconds)
    }
    
    prefix public static func + (x: Self) -> Self {
        .init(milliseconds: +x.milliseconds)
    }
    
    
    public static func + (lhs: Self, rhs: Self) -> Self {
        .init(milliseconds: lhs.milliseconds + rhs.milliseconds)
    }
    
    public static func - (lhs: Self, rhs: Self) -> Self {
        .init(milliseconds: lhs.milliseconds - rhs.milliseconds)
    }
    
    public static func * (lhs: Self, rhs: Self) -> Self {
        .init(milliseconds: lhs.milliseconds * rhs.milliseconds)
    }
    
    public static func / (lhs: Self, rhs: Self) -> Self {
        .init(milliseconds: lhs.milliseconds / rhs.milliseconds)
    }
    

    public static func += (lhs: inout Self, rhs: Self) {
        lhs = .init(milliseconds: lhs.milliseconds + rhs.milliseconds)
    }
    
    public static func -= (lhs: inout Self, rhs: Self) {
        lhs = .init(milliseconds: lhs.milliseconds - rhs.milliseconds)
    }
    
    public static func *= (lhs: inout Self, rhs: Self) {
        lhs = .init(milliseconds: lhs.milliseconds * rhs.milliseconds)
    }
    
    public static func /= (lhs: inout Self, rhs: Self) {
        lhs = .init(milliseconds: lhs.milliseconds / rhs.milliseconds)
    }
    
}
