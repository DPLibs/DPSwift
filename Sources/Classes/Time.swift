import Foundation

/// Struct for determining the time.
///
public struct Time {
    
    // MARK: - Props
    
    /// Hours value.
    ///
    public let hours: Int
    
    /// Minutes value.
    ///
    public let minutes: Int
    
    /// Seconds value.
    ///
    public let seconds: Int
    
    /// Milliseconds value.
    ///
    public let milliseconds: Int
    
    // MARK: - Init
    
    /// Initialize  default.
    /// - Parameter hours - Hours value.
    /// - Parameter minutes - Minutes value.
    /// - Parameter seconds - Seconds value.
    /// - Parameter milliseconds - Milliseconds value.
    ///
    public init(
        hours: Int,
        minutes: Int,
        seconds: Int,
        milliseconds: Int
    ) {
        self.hours = hours
        self.minutes = minutes
        self.seconds = seconds
        self.milliseconds = milliseconds
    }
    
    /// Initialize  by millesecondsInterval.
    /// - Parameter millesecondsInterval - Interval of milliseconds.
    ///
    public init(millesecondsInterval: Int) {
        let hours = millesecondsInterval / 1000 / 60 / 60
        let minutes = millesecondsInterval / 1000 / 60 % 60
        let seconds = millesecondsInterval / 1000 % 60
        let milliseconds = millesecondsInterval % 1000
        
        self.init(hours: hours, minutes: minutes, seconds: seconds, milliseconds: milliseconds)
    }
    
    /// Initialize  by secondsInterval.
    /// - Parameter secondsInterval - Interval of seconds.
    ///
    public init(secondsInterval: Int) {
        self.init(millesecondsInterval: secondsInterval * 1000)
    }
    
    /// Initialize  by minutesInterval.
    /// - Parameter minutesInterval - Interval of minutes.
    ///
    public init(minutesInterval: Int) {
        self.init(millesecondsInterval: minutesInterval * 1000 * 60)
    }
    
    /// Initialize  by hoursInterval.
    /// - Parameter hoursInterval - Interval of hours.
    ///
    public init(hoursInterval: Int) {
        self.init(millesecondsInterval: hoursInterval * 1000 * 60 * 60)
    }
    
    // MARK: - Methods
    
    /// Returns time value in interval of milliseconds.
    ///
    public func toMillesecondsInterval() -> Int {
        (self.hours * 1000 * 60 * 60) +
        (self.minutes * 1000 * 60) +
        (self.seconds * 1000) +
        self.milliseconds
    }
    
    /// Returns time value in interval of milliseconds.
    ///
    public func toSecondsInterval() -> Int {
        self.toMillesecondsInterval() / 1000
    }
    
    /// Returns time value in interval of milliseconds.
    ///
    public func toMinutesInterval() -> Int {
        self.toMillesecondsInterval() / 1000 / 60
    }
    
    /// Returns time value in interval of milliseconds.
    ///
    public func toHoursInterval() -> Int {
        self.toMillesecondsInterval() / 1000 / 60 / 60
    }
    
}

// MARK: - Time + Equatable
extension Time: Equatable {
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.milliseconds == rhs.milliseconds &&
        lhs.seconds == rhs.seconds &&
        lhs.minutes == rhs.minutes &&
        lhs.hours == rhs.hours
    }
    
}

// MARK: - Time + Comparable
extension Time: Comparable {
    
    public static func < (lhs: Self, rhs: Self) -> Bool {
        guard lhs.hours == rhs.hours else { return lhs.hours < rhs.hours }
        guard lhs.minutes == rhs.minutes else { return lhs.minutes < rhs.minutes }
        guard lhs.seconds >= rhs.seconds else { return lhs.seconds < rhs.seconds }
        return lhs.milliseconds < rhs.milliseconds
    }
    
}

// MARK: - Time + ZeroAdduction
extension Time: ZeroAdduction {
    
    static public var zero: Time {
        .init(hours: .zero, minutes: .zero, seconds: .zero, milliseconds: .zero)
    }

}
