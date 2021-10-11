import Foundation
import UIKit

/// Protocol for number adduction.
///
public protocol NumberAdduction {
    
    /// Returns `Int`.
    ///
    var toInt: Int { get }
    
    /// Returns `Double`.
    ///
    var toDouble: Double { get }
    
    /// Returns `Float`.
    ///
    var toFloat: Float { get }
    
    /// Returns `CGFloat`.
    ///
    var toCGFloat: CGFloat { get }
    
    /// Returns `TimeInterval`.
    ///
    var toTimeInterval: TimeInterval { get }
    
    /// Returns `NSNumber`.
    ///
    var toNSNumber: NSNumber { get }
    
    /// Returns radians `CGFloat` by degrees.
    ///
    var toRadiansByDegrees: CGFloat { get }
    
    /// Returns degrees `CGFloat` by radians.
    ///
    var toDegreesByRadians: CGFloat { get }
    
    /// Return `true` if paramter is number with required maximum count of integer digits and maximum count of fraction digits.
    /// - Parameter maximumIntegerDigits: Maximum count of integer digits.
    /// - Parameter maximumFractionDigits: Maximum count of fraction digits.
    ///
    func isValidFractionalNumber(maximumIntegerDigits: Int, maximumFractionDigits: Int) -> Bool
}

// MARK: - NumberAdduction + Default
public extension NumberAdduction {
    
    func isValidFractionalNumber(maximumIntegerDigits: Int, maximumFractionDigits: Int) -> Bool {
        let formatter = NumberFormatter()
        formatter.allowsFloats = true
        let decimalSeparator = formatter.decimalSeparator ?? "."
        guard let string = formatter.string(from: self.toNSNumber) else { return false }

        let split = string.components(separatedBy: decimalSeparator)
        let integers = split.count == 2 ? split.first ?? "" : string
        let fractions = split.count == 2 ? split.last ?? "" : ""
        return integers.count <= maximumIntegerDigits && fractions.count <= maximumFractionDigits
    }
    
}

// MARK: - Int + NumberAdduction
extension Int: NumberAdduction {
    
    public var toInt: Int {
        self
    }
    
    public var toDouble: Double {
        Double(self)
    }
    
    public var toFloat: Float {
        Float(self)
    }
    
    public var toCGFloat: CGFloat {
        CGFloat(self)
    }
    
    public var toTimeInterval: TimeInterval {
        TimeInterval(self)
    }
    
    public var toNSNumber: NSNumber {
        NSNumber(value: self)
    }
    
    public var toRadiansByDegrees: CGFloat {
        self.toCGFloat.toRadiansByDegrees
    }
    
    public var toDegreesByRadians: CGFloat {
        self.toCGFloat.toDegreesByRadians
    }
    
}

// MARK: - Double + NumberAdduction
extension Double: NumberAdduction {
    
    public var toInt: Int {
        Int(self)
    }
    
    public var toDouble: Double {
        self
    }
    
    public var toFloat: Float {
        Float(self)
    }
    
    public var toCGFloat: CGFloat {
        CGFloat(self)
    }
    
    public var toTimeInterval: TimeInterval {
        TimeInterval(self)
    }
    
    public var toNSNumber: NSNumber {
        NSNumber(value: self)
    }
    
    public var toRadiansByDegrees: CGFloat {
        self.toCGFloat.toRadiansByDegrees
    }
    
    public var toDegreesByRadians: CGFloat {
        self.toCGFloat.toDegreesByRadians
    }
    
}

// MARK: - Float + NumberAdduction
extension Float: NumberAdduction {
    
    public var toInt: Int {
        Int(self)
    }
    
    public var toDouble: Double {
        Double(self)
    }
    
    public var toFloat: Float {
        Float(self)
    }
    
    public var toCGFloat: CGFloat {
        CGFloat(self)
    }
    
    public var toTimeInterval: TimeInterval {
        TimeInterval(self)
    }
    
    public var toNSNumber: NSNumber {
        NSNumber(value: self)
    }
    
    public var toRadiansByDegrees: CGFloat {
        self.toCGFloat.toRadiansByDegrees
    }
    
    public var toDegreesByRadians: CGFloat {
        self.toCGFloat.toDegreesByRadians
    }
    
}

// MARK: - CGFloat + NumberAdduction
extension CGFloat: NumberAdduction {
    
    public var toInt: Int {
        Int(self)
    }
    
    public var toDouble: Double {
        Double(self)
    }
    
    public var toFloat: Float {
        Float(self)
    }
    
    public var toCGFloat: CGFloat {
        self
    }
    
    public var toTimeInterval: TimeInterval {
        TimeInterval(self)
    }
    
    public var toNSNumber: NSNumber {
        NSNumber(value: self.toFloat)
    }
    
    public var toRadiansByDegrees: CGFloat {
        self * .pi / 180
    }
    
    public var toDegreesByRadians: CGFloat {
        self / (.pi / 180)
    }
    
}

// MARK: - NSNumber + NumberAdduction
extension NSNumber: NumberAdduction {
    
    public var toInt: Int {
        self.intValue
    }
    
    public var toDouble: Double {
        self.doubleValue
    }
    
    public var toFloat: Float {
        self.floatValue
    }
    
    public var toCGFloat: CGFloat {
        self.floatValue.toCGFloat
    }
    
    public var toTimeInterval: TimeInterval {
        self.doubleValue.toTimeInterval
    }
    
    public var toNSNumber: NSNumber {
        self
    }
    
    public var toRadiansByDegrees: CGFloat {
        self.toCGFloat.toRadiansByDegrees
    }
    
    public var toDegreesByRadians: CGFloat {
        self.toCGFloat.toDegreesByRadians
    }
    
}
