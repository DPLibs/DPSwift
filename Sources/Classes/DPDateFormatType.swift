import Foundation

/// Struct for storing preset values for dateFormat in DateFromatter.
///
public struct DPDateFormatType {
    
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

// MARK: - DPDateFormatType + ExpressibleByStringLiteral
extension DPDateFormatType: ExpressibleByStringLiteral {
    
    public init(stringLiteral value: String) {
        self.dateFormat = value
    }
    
}

// MARK: - DPDateFormatType + Constants
public extension DPDateFormatType {
    
    /// Constant DateFormatType("dd.MM.yyyy"). Example: 01.01.2020.
    ///
    ///     let date = Date()
    ///     print(date.toLocalString(withFormat: .default)) // 01.01.2020
    ///
    static let `default` = DPDateFormatType("dd.MM.yyyy")
    
    /// Constant DateFormatType("dd MMMM yyyy"). Example: 01 января 2020.
    ///
    ///     let date = Date()
    ///     print(date.toLocalString(withFormat: .dateWithMonthWords)) // 01 января 2020
    ///
    static let dateWithMonthWords = DPDateFormatType("dd MMMM yyyy")
    
    /// Constant DateFormatType("LLLL"). Example: 01 января 2020.
    ///
    ///     let date = Date()
    ///     print(date.toLocalString(withFormat: .monthFullWords)) // январь
    ///
    static let monthFullWords = DPDateFormatType("LLLL")
    
    /// Constant DateFormatType("LLLL yyyy"). Example: январь 2020.
    ///
    ///     let date = Date()
    ///     print(date.toLocalString(withFormat: .monthFullWordsWithYear)) // январь 2020
    ///
    static let monthFullWordsWithYear = DPDateFormatType("LLLL yyyy")
    
    /// Constant DateFormatType("eee"). Example: пн.
    ///
    ///     let date = Date()
    ///     print(date.toLocalString(withFormat: .weekDayWordsShort)) // пн
    ///
    static let weekDayWordsShort = DPDateFormatType("eee")
    
    /// Constant DateFormatType("hh:mm"). Example: 22:37.
    ///
    ///     let date = Date()
    ///     print(date.toLocalString(withFormat: .time)) // 22:37
    ///
    static let time = DPDateFormatType("hh:mm")
}

// MARK: - DateFormatter + DPDateFormatType
public extension DateFormatter {
    
    var dateFormatType: DPDateFormatType {
        get { DPDateFormatType(self.dateFormat) }
        set { self.dateFormat = newValue.dateFormat }
    }
    
}

// MARK: - Date + DPDateFormatType
public extension Date {

    /// Returns the date as a string with a given dateFormatType.
    ///
    ///     let date = Date()
    ///     print(date.toLocalString(withFormat: .init("dd.MM.yyyy"))) // 01.01.2020
    ///
    /// - Parameter type: DPDateFormatType.
    /// - Parameter locale: Locale
    /// - Returns: Date as a string with a given dateFormatType.
    ///
    func toLocalString(withFormatType type: DPDateFormatType = .default, locale: Locale = .current) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = locale
        dateFormatter.dateFormatType = type
        
        return dateFormatter.string(from: self)
    }
    
}
