import Foundation

/// Protocol for the implementation of mathematical operations.
///
public protocol DPMathematical {
    prefix static func - (x: Self) -> Self
    prefix static func + (x: Self) -> Self
    
    static func + (lhs: Self, rhs: Self) -> Self
    static func - (lhs: Self, rhs: Self) -> Self
    static func * (lhs: Self, rhs: Self) -> Self
    static func / (lhs: Self, rhs: Self) -> Self

    static func += (lhs: inout Self, rhs: Self)
    static func -= (lhs: inout Self, rhs: Self)
    static func *= (lhs: inout Self, rhs: Self)
    static func /= (lhs: inout Self, rhs: Self)
}

