import Foundation
import UIKit

/// Struct for defining the geometric angle.
///
public struct DPAngle {
    
    // MARK: - Props
    
    /// Degrees value.
    ///
    public let degrees: CGFloat
    
    /// Radians value.
    ///
    public let radians: CGFloat
    
    // MARK: - Init
    
    /// Initialize  from degrees value.
    /// - Parameter degrees - Degrees value.
    ///
    public init(degrees: CGFloat) {
        self.degrees = degrees
        self.radians = degrees.toRadiansByDegrees
    }
    
    /// Initialize  from radians value.
    /// - Parameter radians - Radians value.
    ///
    public init(radians: CGFloat) {
        self.degrees = radians.toDegreesByRadians
        self.radians = radians
    }
}

// MARK: - DPAngle + Equatable
extension DPAngle: Equatable {
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.degrees == rhs.degrees &&
        lhs.radians == rhs.radians
    }
    
}

// MARK: - DPAngle + Comparable
extension DPAngle: Comparable {
    
    public static func < (lhs: Self, rhs: Self) -> Bool {
        lhs.degrees < rhs.degrees &&
        lhs.radians < rhs.radians
    }
    
}

// MARK: - DPAngle + DPMathematical
extension DPAngle: DPMathematical {
    
    prefix public static func - (x: Self) -> Self {
        .init(degrees: -x.degrees)
    }
    
    prefix public static func + (x: Self) -> Self {
        .init(degrees: +x.degrees)
    }
    
    
    public static func + (lhs: Self, rhs: Self) -> Self {
        .init(degrees: lhs.degrees + rhs.degrees)
    }
    
    public static func - (lhs: Self, rhs: Self) -> Self {
        .init(degrees: lhs.degrees - rhs.degrees)
    }
    
    public static func * (lhs: Self, rhs: Self) -> Self {
        .init(degrees: lhs.degrees * rhs.degrees)
    }
    
    public static func / (lhs: Self, rhs: Self) -> Self {
        .init(degrees: lhs.degrees / rhs.degrees)
    }
    

    public static func += (lhs: inout Self, rhs: Self) {
        lhs = .init(degrees: lhs.degrees + rhs.degrees)
    }
    
    public static func -= (lhs: inout Self, rhs: Self) {
        lhs = .init(degrees: lhs.degrees - rhs.degrees)
    }
    
    public static func *= (lhs: inout Self, rhs: Self) {
        lhs = .init(degrees: lhs.degrees * rhs.degrees)
    }
    
    public static func /= (lhs: inout Self, rhs: Self) {
        lhs = .init(degrees: lhs.degrees / rhs.degrees)
    }
    
}
