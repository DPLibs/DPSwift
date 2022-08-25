import Foundation

/// Struct for determining the timeStamp.
///
public struct DPTimeStamp {
    
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
    /// - Parameter time: Value of `DPTime`.
    ///
    public func addingDate(_ date: Date?) -> DPTimeStamp {
        let interval = (date?.timeIntervalSince1970 ?? 0.0) * 1000
        
        return .init(milliseconds: self.milliseconds + interval)
    }
    
    /// Adds `time` as an interval of milliseconds.
    /// - Parameter time: Value of `DPTime`.
    ///
    public func addingTime(_ time: DPTime?) -> DPTimeStamp {
        let interval = time?.toMillesecondsInterval().toDouble ?? 0.0
        
        return .init(milliseconds: self.milliseconds + interval)
    }
    
    /// Adds `timeInit` as milliseconds.
    /// - Parameter timeUnit: Value of `DPTimeInterval`.
    ///
    public func addingTimeUnit(_ timeUnit: DPTimeInterval?) -> DPTimeStamp {
        let interval = timeUnit?.milliseconds ?? 0.0
        
        return .init(milliseconds: self.milliseconds + interval)
    }
}

// MARK: - DPTimeStamp + Codable
extension DPTimeStamp: Codable {
    
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

// MARK: - DPTimeStamp + Equatable
extension DPTimeStamp: Equatable {
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.milliseconds == rhs.milliseconds &&
        lhs.seconds == rhs.seconds
    }
    
}

// MARK: - DPTimeStamp + Comparable
extension DPTimeStamp: Comparable {
    
    public static func < (lhs: Self, rhs: Self) -> Bool {
        lhs.milliseconds < rhs.milliseconds &&
        lhs.seconds < rhs.seconds
    }
    
}

// MARK: - DPTimeStamp + ZeroAdduction
extension DPTimeStamp: ZeroAdduction {
    
    static public var zero: DPTimeStamp {
        .init(milliseconds: .zero)
    }
    
}

// MARK: - DPTimeStamp + TimeStructAdduction
extension DPTimeStamp: TimeStructAdduction {
    
    public var toDate: Date {
        .init(timeIntervalSince1970: self.seconds)
    }
    
    public var toTimeStamp: DPTimeStamp {
        self
    }
    
    public var toTimeUnit: DPTimeInterval {
        .init(milliseconds: self.milliseconds)
    }
    
}

// MARK: - DPTimeStamp + Mathematical
extension DPTimeStamp: Mathematical {
    
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
