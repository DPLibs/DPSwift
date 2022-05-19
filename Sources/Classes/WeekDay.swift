import Foundation

/// Enum for determining the week day type.
///
public enum WeekDay: Int {
    
    /// Sunday. RawValue = 1. RU: Воскресенье.
    ///
    case sunday = 1
    
    /// Monday. RawValue = 2. RU: Понедельник.
    ///
    case monday = 2
    
    /// Tuesday. RawValue = 3. RU: Вторник.
    ///
    case tuesday = 3
    
    /// Wednesday. RawValue = 4. RU: Среда.
    ///
    case wednesday = 4
    
    /// Thursday. RawValue = 5. RU: Четверг.
    ///
    case thursday = 5
    
    /// Friday. RawValue = 6. RU: Пятница.
    ///
    case friday = 6
    
    /// Saturday. RawValue = 7. RU: Суббота.
    ///
    case saturday = 7

}

public extension WeekDay {
    
    /// `next` week day
    ///
    var next: WeekDay {
        switch self {
        case .sunday:
            return .monday
        case .monday:
            return .tuesday
        case .tuesday:
            return .wednesday
        case .wednesday:
            return .thursday
        case .thursday:
            return .friday
        case .friday:
            return .saturday
        case .saturday:
            return .sunday
        }
    }

    /// `previous` week day
    ///
    var previous: WeekDay {
        switch self {
        case .sunday:
            return .saturday
        case .monday:
            return .sunday
        case .tuesday:
            return .monday
        case .wednesday:
            return .tuesday
        case .thursday:
            return .wednesday
        case .friday:
            return .thursday
        case .saturday:
            return .friday
        }
    }

    /// Last day of the week if `self` is the start day
    ///
    var weekEndDay: WeekDay {
        self.generateWeek().last ?? self
    }

    /// Genetate week  if `self` is the start day
    ///
    func generateWeek() -> [WeekDay] {
        var result: [WeekDay] = [self]
        var day: WeekDay = self
        
        while result.last != self.previous {
            let next = day.next
            result += [next]
            day = next
        }
        
        return result
    }

    #warning("To DPSwift")
    var title: String {
        let calendar = Calendar.current
        let date = calendar.date(bySetting: .weekday, value: self.rawValue, of: .init())
        let title = date?.toLocalString(withFormatType: .init("E")) ?? ""
        return title
    }
    
}

// MARK: - StringFormat
public extension WeekDay {
    
    /// Used Date and time patterns `E`
    ///
    enum StringFormat: String {
        
        /// Example: Thu
        ///
        case e = "e"
        
        /// Example: Thu
        ///
        case ee = "ee"
        
        /// Example: Thursday
        ///
        case eee = "eee"
        
        /// Example: T
        ///
        case eeee = "eeee"
        
    }
    
    func toLocalString(with format: StringFormat) -> String {
        let calendar = Calendar.current
        let date = calendar.date(bySetting: .weekday, value: self.rawValue, of: .init())
        let dateFromatType = DateFormatType(format.rawValue)
        let localString = date?.toLocalString(withFormatType: dateFromatType) ?? ""
        return localString
    }
    
}
