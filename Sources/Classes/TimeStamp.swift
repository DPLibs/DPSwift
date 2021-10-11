import Foundation

/// Struct for determining the timeStamp.
///
public struct TimeStamp {
    
    // MARK: - Props
    
    /// Milliseconds value.
    ///
    public let milliseconds: Double
    
    /// Seconds value.
    ///
    public let seconds: Double
    
    // MARK: - Init
    
    /// Initialize  from milliseconds value.
    /// - Parameter milliseconds - Milliseconds value.
    ///
    public init(milliseconds: Double) {
        self.milliseconds = milliseconds
        self.seconds = milliseconds / 1000
    }
    
    /// Initialize  from milliseconds optional value.
    /// - Parameter millisecondsOptional - Milliseconds optional value.
    ///
    public init?(millisecondsOptional: Double?) {
        guard let milliseconds = millisecondsOptional else { return nil }
        self.init(milliseconds: milliseconds)
    }
    
    /// Initialize  from seconds value.
    /// - Parameter seconds - Seconds value.
    ///
    public init(seconds: Double) {
        self.init(milliseconds: seconds * 1000)
    }
    
    /// Initialize  from seconds optional value.
    /// - Parameter secondsOptional - Seconds optional value.
    ///
    public init?(secondsOptional: Double?) {
        guard let seconds = secondsOptional else { return nil }
        self.init(seconds: seconds)
    }
    
    /// Initialize  from date value.
    /// - Parameter date - Date optional value.
    ///
    public init(date: Date) {
        self.init(seconds: date.timeIntervalSince1970)
    }
    
    /// Initialize  from dateOptional value.
    /// - Parameter dateOptional - Date optional optional value.
    ///
    public init?(dateOptional: Date?) {
        guard let date = dateOptional else { return nil }
        self.init(date: date)
    }
    
    // MARK: - Methods
    
    /// Adds `time` as an interval of milliseconds.
    /// - Parameter time: Value of `Time`.
    ///
    public func addingDate(_ date: Date?) -> TimeStamp {
        let interval = (date?.timeIntervalSince1970 ?? 0.0) * 1000
        
        return .init(milliseconds: self.milliseconds + interval)
    }
    
    /// Adds `time` as an interval of milliseconds.
    /// - Parameter time: Value of `Time`.
    ///
    public func addingTime(_ time: Time?) -> TimeStamp {
        let interval = time?.toMillesecondsInterval().toDouble ?? 0.0
        
        return .init(milliseconds: self.milliseconds + interval)
    }
    
    /// Adds `timeInit` as milliseconds.
    /// - Parameter timeUnit: Value of `TimeUnit`.
    ///
    public func addingTimeUnit(_ timeUnit: TimeUnit?) -> TimeStamp {
        let interval = timeUnit?.milliseconds ?? 0.0
        
        return .init(milliseconds: self.milliseconds + interval)
    }
}

// MARK: - TimeStamp + Codable
extension TimeStamp: Codable {
    
    // MARK: - Decodable
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let milliseconds = try container.decode(Double.self)
        
        self.init(milliseconds: milliseconds)
    }
    
    // MARK: - Encodable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(self.milliseconds.toInt)
    }
    
}

// MARK: - TimeStamp + Equatable
extension TimeStamp: Equatable {
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.milliseconds == rhs.milliseconds &&
        lhs.seconds == rhs.seconds
    }
    
}

// MARK: - TimeStamp + Comparable
extension TimeStamp: Comparable {
    
    public static func < (lhs: Self, rhs: Self) -> Bool {
        lhs.milliseconds < rhs.milliseconds &&
        lhs.seconds < rhs.seconds
    }
    
}

// MARK: - TimeStamp + ZeroAdduction
extension TimeStamp: ZeroAdduction {
    
    static public var zero: TimeStamp {
        .init(milliseconds: .zero)
    }
    
}

// MARK: - TimeStamp + TimeStructAdduction
extension TimeStamp: TimeStructAdduction {
    
    public var toDate: Date {
        .init(timeIntervalSince1970: self.seconds)
    }
    
    public var toTimeStamp: TimeStamp {
        self
    }
    
    public var toTimeUnit: TimeUnit {
        .init(milliseconds: self.milliseconds)
    }
    
}

// MARK: - TimeStamp + Mathematical
extension TimeStamp: Mathematical {
    
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
