import Foundation
import UIKit

/// Protocol for number adduction optional.
///
public protocol NumberAdductionOptional {
    
    /// Retruns `true` if paramter is number.
    ///
    var isNumber: Bool { get }
    
    /// Returns `Int`.
    ///
    var toInt: Int? { get }
    
    /// Returns `Double`.
    ///
    var toDouble: Double? { get }
    
    /// Returns `Float`.
    ///
    var toFloat: Float? { get }
    
    /// Returns `CGFloat`.
    ///
    var toCGFloat: CGFloat? { get }
    
    /// Returns `TimeInterval`.
    ///
    var toTimeInterval: TimeInterval? { get }
    
    /// Returns `NSNumber`.
    ///
    var toNSNumber: NSNumber? { get }
    
    /// Returns radians `CGFloat` by degrees.
    ///
    var toRadiansByDegrees: CGFloat? { get }
    
    /// Returns degrees `CGFloat` by radians.
    ///
    var toDegreesByRadians: CGFloat? { get }
    
    /// Return `true` if paramter is number with required maximum count of integer digits and maximum count of fraction digits.
    /// - Parameter maximumIntegerDigits: Maximum count of integer digits.
    /// - Parameter maximumFractionDigits: Maximum count of fraction digits.
    ///
    func isValidFractionalNumber(maximumIntegerDigits: Int, maximumFractionDigits: Int) -> Bool
}

// MARK: - String + NumberAdductionOptional
extension String: NumberAdductionOptional {
    
    public var isNumber: Bool {
        self.toInt != nil
    }
    
    public var toInt: Int? {
        Int(self)
    }
    
    public var toDouble: Double? {
        Double(self)
    }
    
    public var toFloat: Float? {
        Float(self)
    }
    
    public var toCGFloat: CGFloat? {
        self.toFloat?.toCGFloat
    }
    
    public var toTimeInterval: TimeInterval? {
        TimeInterval(self)
    }
    
    public var toNSNumber: NSNumber? {
        guard let value = self.toDouble else { return nil }
        return NSNumber(value: value)
    }
    
    public var toRadiansByDegrees: CGFloat? {
        self.toCGFloat?.toRadiansByDegrees
    }
    
    public var toDegreesByRadians: CGFloat? {
        self.toCGFloat?.toDegreesByRadians
    }
    
    public func isValidFractionalNumber(maximumIntegerDigits: Int, maximumFractionDigits: Int) -> Bool {
        let formatter = NumberFormatter()
        formatter.allowsFloats = true
        let decimalSeparator = formatter.decimalSeparator ?? "."
        guard formatter.number(from: self) != nil else { return false }

        let split = self.components(separatedBy: decimalSeparator)
        let integers = split.count == 2 ? split.first ?? "" : self
        let fractions = split.count == 2 ? split.last ?? "" : ""
        return integers.count <= maximumIntegerDigits && fractions.count <= maximumFractionDigits
    }
}
