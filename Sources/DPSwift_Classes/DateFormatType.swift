import Foundation

/// Struct for storing preset values for dateFormat in DateFromatter.
///
public struct DateFormatType {
    
    /// Variable dateFormat for use in DateFromatter. Example: `dd.MM.yyyy`
    ///
    public let dateFormat: String
    
    /// Variable dateFormat for use in DateFromatter. Example: `dd.MM.yyyy`
    /// - Parameter dateFormat - Variable dateFormat for use in DateFromatter. Example: `dd.MM.yyyy`.
    ///
    public init(_ dateFormat: String) {
        self.dateFormat = dateFormat
    }
}

// MARK: - DateFormatType + Constants
public extension DateFormatType {
    
    /// Constant DateFormatType("dd.MM.yyyy"). Example: 01.01.2020.
    ///
    ///     let date = Date()
    ///     print(date.toLocalString(withFormat: .default)) // 01.01.2020
    ///
    static let `default` = DateFormatType("dd.MM.yyyy")
    
    /// Constant DateFormatType("dd MMMM yyyy"). Example: 01 января 2020.
    ///
    ///     let date = Date()
    ///     print(date.toLocalString(withFormat: .dateWithMonthWords)) // 01 января 2020
    ///
    static let dateWithMonthWords = DateFormatType("dd MMMM yyyy")
    
    /// Constant DateFormatType("LLLL"). Example: 01 января 2020.
    ///
    ///     let date = Date()
    ///     print(date.toLocalString(withFormat: .monthFullWords)) // январь
    ///
    static let monthFullWords = DateFormatType("LLLL")
    
    /// Constant DateFormatType("LLLL yyyy"). Example: январь 2020.
    ///
    ///     let date = Date()
    ///     print(date.toLocalString(withFormat: .monthFullWordsWithYear)) // январь 2020
    ///
    static let monthFullWordsWithYear = DateFormatType("LLLL yyyy")
    
    /// Constant DateFormatType("eee"). Example: пн.
    ///
    ///     let date = Date()
    ///     print(date.toLocalString(withFormat: .weekDayWordsShort)) // пн
    ///
    static let weekDayWordsShort = DateFormatType("eee")
    
    /// Constant DateFormatType("hh:mm"). Example: 22:37.
    ///
    ///     let date = Date()
    ///     print(date.toLocalString(withFormat: .time)) // 22:37
    ///
    static let time = DateFormatType("hh:mm")
}

// MARK: - DateFormatter + DateFormatType
public extension DateFormatter {
    
    func appendDateFormatType(_ type: DateFormatType) {
        self.dateFormat = type.dateFormat
    }
    
}

// MARK: - Date + DateFormatType
public extension Date {

    /// Returns the date as a string with a given dateFormatType.
    ///
    ///     let date = Date()
    ///     print(date.toLocalString(withFormat: .init("dd.MM.yyyy"))) // 01.01.2020
    ///
    /// - Parameter type: DateFormatType.
    /// - Returns: Date as a string with a given dateFormatType.
    ///
    func toLocalString(withFormatType type: DateFormatType = .default) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.appendDateFormatType(type)
        
        return dateFormatter.string(from: self)
    }
    
}
