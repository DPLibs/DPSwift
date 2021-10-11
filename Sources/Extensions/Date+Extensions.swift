import Foundation

public extension Date {
    
    /// Return now `Date` with `Time` of `Calendar`.
    /// - Parameter time: Current time.
    /// - Parameter calendar: Calendar for date.
    /// - Returns: Date with time of calendar.
    ///
    static func now(withTime time: Time = .zero, of calendar: Calendar = .current) -> Date {
        let now = Date()
        
        return calendar.date(bySettingHour: time.hours, minute: time.minutes, second: time.seconds, of: now) ?? now
    }
    
    // MARK: - Add methods
    
    /// Return date with adding dateComponent value.
    /// - Parameter component: type of dateComponent.
    /// - Parameter value: value of dateComponent.
    /// - Returns: Date with adding dateComponent.
    ///
    func addingComponent(_ component: Calendar.Component, value: Int) -> Date? {
        Calendar.current.date(byAdding: component, value: value, to: self)
    }
    
    /// Return date with adding days.
    /// - Parameter years: Days to adding.
    /// - Returns: Date with adding days.
    ///
    func addingDays(_ days: Int) -> Date {
        self.addingTimeInterval(TimeInterval(days * 60 * 60 * 24))
    }
    
    /// Return date with adding years.
    /// - Parameter years: Years to adding.
    /// - Returns: Date with adding years.
    ///
    func addingYears(_ years: Int) -> Date? {
        self.addingComponent(.year, value: years)
    }
    
    // MARK: - Get methods
    
    /// Return week of year number.
    /// - Returns: Week of year number.
    ///
    func getWeekOfYear() -> Int {
        Calendar.current.component(.weekOfYear, from: self)
    }
    
    /// Return age from birthday date.
    /// - Returns: Age value.
    ///
    var ageFromBirthday: Int {
        Calendar.current.dateComponents([.year, .month], from: self, to: Date()).year ?? 0
    }
    
    /// Return first date of month.
    /// - Returns: first date of month.
    ///
    var firstDateOfMonth: Date? {
        Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Calendar.current.startOfDay(for: self)))
    }

    /// Return last date of month.
    /// - Returns: last date of month.
    ///
    var lastDateOfMonth: Date? {
        guard let startDateOfMonth = self.firstDateOfMonth else { return nil }
        return Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: startDateOfMonth)
    }
    
    /// Returns all dates of the days of the current week.
    /// - Parameter firstWeekday: Starting day of the week. Default: `monday`.
    /// - Returns: Dates of the days of the current week .
    ///
    func getWeekDates(firstWeekday: WeekDay = .monday) -> [Date] {
        var calendar = Calendar.current
        calendar.firstWeekday = firstWeekday.rawValue
    
        let today = calendar.startOfDay(for: self)
        guard let weekInterval = calendar.dateInterval(of: .weekOfYear, for: today) else { return [] }
    
        var week: [Date] = []
        for i in 0...6 {
            guard let day = calendar.date(byAdding: .day, value: i, to: weekInterval.start) else { continue }
            week += [day]
        }
    
        return week
    }
    
    /// Returns all dates of the days of the current week with dates of many weeks next.
    /// - Parameter weeksCount: Count of weeks next.
    /// - Parameter firstWeekday: Starting day of the week. Default: `monday`.
    /// - Returns: Dates of the days of the current week .
    ///
    func getWeekDates(withManyWeeksNext weeksCount: Int, firstWeekday: WeekDay = .monday) -> [Date] {
        var result: [Date] = []
        let current = self
    
        for index in 0...weeksCount {
            guard let date = current.addingComponent(.day, value: index * 7) else { continue }
            result += date.getWeekDates(firstWeekday: firstWeekday)
        }
    
        result.sort()
        return result
    }
    
    /// Returns all dates of the days of the current month.
    /// - Returns: Dates of the days of the current month.
    ///
    func getMonthDates() -> [Date] {
        guard let range = Calendar.current.range(of: .day, in: .month, for: self), var day = self.firstDateOfMonth else { return [] }
        var days: [Date] = []
        
        for _ in 1...range.count {
            days.append(day)
            day = day.addingDays(1)
        }
        
        return days
    }
    
    /// Returns value of calendar component.
    /// - Parameter compontent: Calendar component.
    /// - Returns: Compenent in value.
    ///
    func getCompontent(_ compontent: Calendar.Component) -> Int {
        Calendar.current.component(compontent, from: self)
    }
    
    // MARK: - Compare methods
    
    /// Returns true if self is equal to date with granularity to day.
    /// - Parameter date: Date for comparison.
    /// - Returns: Comparison result.
    ///
    func isEqualToDateToGranularityDay(_ date: Date) -> Bool {
        Calendar.current.compare(self, to: date, toGranularity: .day) == .orderedSame
    }
    
    /// Returns true if self is less to date with granularity to day.
    /// - Parameter date: Date for comparison.
    /// - Returns: Comparison result.
    ///
    func isLessDateToGranularityDay(_ date: Date) -> Bool {
        Calendar.current.compare(self, to: date, toGranularity: .day) == .orderedAscending
    }
    
}

// MARK: - Date + TimeStructAdduction
extension Date: TimeStructAdduction {
    
    public var toDate: Date {
        self
    }
    
    public var toTimeStamp: TimeStamp {
        .init(seconds: self.timeIntervalSince1970)
    }
    
    public var toTimeUnit: TimeUnit {
        .init(seconds: self.timeIntervalSince1970)
    }
    
}
