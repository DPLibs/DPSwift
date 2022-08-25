import Foundation

public extension Date {
    
    /// Return now `Date` with `DPTime` of `Calendar`.
    /// - Parameter time: Current time.
    /// - Parameter calendar: Calendar for date.
    /// - Returns: Date with time of calendar.
    ///
    static func today(withTime time: DPTime = .zero, calendar: Calendar = .current) -> Date {
        let date = Date()
        let result = calendar.date(bySettingHour: time.hours, minute: time.minutes, second: time.seconds, of: date) ?? date
        
        return result
    }
    
    /// Return yesterday `Date` with `DPTime` of `Calendar`.
    /// - Parameter time: Current time.
    /// - Parameter calendar: Calendar for date.
    /// - Returns: Date with time of calendar.
    ///
    static func yesterday(withTime time: DPTime = .zero, calendar: Calendar = .current) -> Date {
        let date = Date().addingComponent(.day, value: -1, calendar: calendar) ?? Date()
        let result = calendar.date(bySettingHour: time.hours, minute: time.minutes, second: time.seconds, of: date) ?? date
        
        return result
    }
    
    // MARK: - Add methods
    
    /// Return date with adding dateComponent value.
    /// - Parameter component: type of dateComponent.
    /// - Parameter value: value of dateComponent.
    /// - Parameter calendar: Calendar for date.
    /// - Returns: Date with adding dateComponent.
    ///
    func addingComponent(_ component: Calendar.Component, value: Int, calendar: Calendar = .current) -> Date? {
        calendar.date(byAdding: component, value: value, to: self)
    }
    
    // MARK: - Get methods
    
    /// Return week of year number.
    /// - Parameter calendar: Calendar for date.
    /// - Returns: Week of year number.
    ///
    func weekOfYear(calendar: Calendar = .current) -> Int {
        calendar.component(.weekOfYear, from: self)
    }
    
    /// Return age from birthday date.
    /// - Parameter calendar: Calendar for date.
    /// - Returns: Age value.
    ///
    func ageFromBirthday(calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.year, .month], from: self, to: Date()).year ?? 0
    }
    
    /// Return first date of month.
    /// - Parameter calendar: Calendar for date.
    /// - Returns: first date of month.
    ///
    func startOfMonth(calendar: Calendar = .current) -> Date? {
        let startOfDay = calendar.startOfDay(for: self)
        let dateComponents = calendar.dateComponents([.year, .month], from: startOfDay)
        let result = calendar.date(from: dateComponents)
        
        return result
    }

    /// Return last date of month.
    /// - Parameter calendar: Calendar for date.
    /// - Returns: last date of month.
    ///
    func endOfMonth(calendar: Calendar = .current) -> Date? {
        guard let startOfMonth = self.startOfMonth(calendar: calendar) else { return nil }
        let dateComponents = DateComponents(month: 1, day: -1)
        let result = calendar.date(byAdding: dateComponents, to: startOfMonth)
        
        return result
    }
    
    /// Returns all dates of the days of the current week.
    /// - Parameter calendar: Calendar for date.
    /// - Returns: Dates of the days of the current week .
    ///
    func weekDates(calendar: Calendar = .current) -> [Date] {
        let today = calendar.startOfDay(for: self)
        guard let weekInterval = calendar.dateInterval(of: .weekOfYear, for: today) else { return [] }
    
        var week: [Date] = []
        for i in 0...6 {
            guard let day = calendar.date(byAdding: .day, value: i, to: weekInterval.start) else { continue }
            week += [day]
        }
    
        return week
    }
    
    /// Returns all dates of the days of the current month.
    /// - Parameter calendar: Calendar for date.
    /// - Returns: Dates of the days of the current month.
    ///
    func monthDates(calendar: Calendar = .current) -> [Date] {
        guard
            let range = calendar.range(of: .day, in: .month, for: self),
            var day = self.startOfMonth(calendar: calendar)
        else { return [] }
        
        var days: [Date] = []
        
        for _ in 1...range.count {
            days.append(day)
            
            guard let nextDay = day.addingComponent(.day, value: 1, calendar: calendar) else { break }
            day = nextDay
        }
        
        return days
    }
    
    /// Returns value of calendar component.
    /// - Parameter compontent: Calendar component.
    /// - Parameter calendar: Calendar for date.
    /// - Returns: Compenent in value.
    ///
    func getCompontent(_ compontent: Calendar.Component, calendar: Calendar = .current) -> Int {
        calendar.component(compontent, from: self)
    }
    
    // MARK: - Compare methods
    
    /// Returns true if self is equal to date with granularity to day.
    /// - Parameter date: Date for comparison.
    /// - Parameter component: Component to granularity.
    /// - Parameter calendar: Calendar for date.
    /// - Returns: Comparison result.
    ///
    func isEqual(to date: Date, toGranularity component: Calendar.Component = .day, calendar: Calendar = .current) -> Bool {
        calendar.compare(self, to: date, toGranularity: component) == .orderedSame
    }
    
    /// Returns true if self is less to date with granularity to day.
    /// - Parameter date: Date for comparison.
    /// - Parameter component: Component to granularity.
    /// - Parameter calendar: Calendar for date.
    /// - Returns: Comparison result.
    ///
    func isLess(than date: Date, toGranularity component: Calendar.Component = .day, calendar: Calendar = .current) -> Bool {
        calendar.compare(self, to: date, toGranularity: component) == .orderedAscending
    }
    
    /// Returns true if self is greater to date with granularity to day.
    /// - Parameter date: Date for comparison.
    /// - Parameter component: Component to granularity.
    /// - Parameter calendar: Calendar for date.
    /// - Returns: Comparison result.
    ///
    func isGreater(than date: Date, toGranularity component: Calendar.Component = .day, calendar: Calendar = .current) -> Bool {
        calendar.compare(self, to: date, toGranularity: component) == .orderedDescending
    }
    
}

// MARK: - Date + TimeStructAdduction
extension Date: TimeStructAdduction {
    
    public var toDate: Date {
        self
    }
    
    public var toTimeStamp: DPTimeStamp {
        .init(seconds: self.timeIntervalSince1970)
    }
    
    public var toTimeUnit: DPTimeInterval {
        .init(seconds: self.timeIntervalSince1970)
    }
    
}

// MARK: - Date + DPTime
public extension Date {
    
    func setTime(_ time: DPTime, calendar: Calendar = .current) -> Date {
        let date = self
        
        return calendar.date(bySettingHour: time.hours, minute: time.minutes, second: time.seconds, of: date) ?? date
    }
    
    func getTime(calendar: Calendar = .current) -> DPTime {
        let date = self
        let dateComponents = calendar.dateComponents([.hour, .minute, .second, .nanosecond], from: date)
        
        return .init(
            hours: dateComponents.hour ?? 0,
            minutes: dateComponents.minute ?? 0,
            seconds: dateComponents.second ?? 0,
            milliseconds: (dateComponents.nanosecond ?? 0) / 1_000_000
        )
    }
    
}
