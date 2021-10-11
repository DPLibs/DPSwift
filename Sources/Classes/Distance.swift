import Foundation

/// Struct for defining the distance.
///
public struct Distance {
    
    // MARK: - Props
    
    /// Millimeters value.
    ///
    public let millimeters: Float
    
    /// Centimeters value.
    ///
    public let centimeters: Float
    
    /// Metters value.
    ///
    public let metters: Float
    
    /// Kilometters value.
    ///
    public let kilometters: Float
    
    /// Miles value.
    ///
    public let miles: Float
    
    // MARK: - Init
    
    /// Initialize  from millimeters value.
    /// - Parameter millimeters - Millimeters value.
    ///
    public init(millimeters: Float) {
        self.millimeters = millimeters
        self.centimeters = millimeters / 10
        self.metters = self.centimeters / 100
        self.kilometters = self.metters / 1000
        self.miles = self.kilometters * 0.62137
    }
    
    /// Initialize  from centimeters value.
    /// - Parameter centimeters - Centimeters value.
    ///
    public init(centimeters: Float) {
        self.init(millimeters: centimeters * 10)
    }
    
    /// Initialize  from metters value.
    /// - Parameter metters - Metters value.
    ///
    public init(metters: Float) {
        self.init(centimeters: metters * 100)
    }
    
    /// Initialize  from kilometters value.
    /// - Parameter kilometters - Kilometters value.
    ///
    public init(kilometters: Float) {
        self.init(metters: kilometters * 1000)
    }
    
    /// Initialize  from miles value.
    /// - Parameter miles - Miles value.
    ///
    public init(miles: Float) {
        self.init(kilometters: miles / 0.62137)
    }
    
}

// MARK: - Distance + Equatable
extension Distance: Equatable {
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.millimeters == rhs.millimeters
    }
    
}

// MARK: - Distance + Equatable
extension Distance: Comparable {
    
    public static func < (lhs: Self, rhs: Self) -> Bool {
        lhs.millimeters < rhs.millimeters
    }
    
}

// MARK: - Distance + Mathematical
extension Distance: Mathematical {
    
    prefix public static func - (x: Self) -> Self {
        .init(millimeters: -x.millimeters)
    }
    
    prefix public static func + (x: Self) -> Self {
        .init(millimeters: +x.millimeters)
    }
    
    
    public static func + (lhs: Self, rhs: Self) -> Self {
        .init(millimeters: lhs.millimeters + rhs.millimeters)
    }
    
    public static func - (lhs: Self, rhs: Self) -> Self {
        .init(millimeters: lhs.millimeters - rhs.millimeters)
    }
    
    public static func * (lhs: Self, rhs: Self) -> Self {
        .init(millimeters: lhs.millimeters * rhs.millimeters)
    }
    
    public static func / (lhs: Self, rhs: Self) -> Self {
        .init(millimeters: lhs.millimeters / rhs.millimeters)
    }
    

    public static func += (lhs: inout Self, rhs: Self) {
        lhs = .init(millimeters: lhs.millimeters + rhs.millimeters)
    }
    
    public static func -= (lhs: inout Self, rhs: Self) {
        lhs = .init(millimeters: lhs.millimeters - rhs.millimeters)
    }
    
    public static func *= (lhs: inout Self, rhs: Self) {
        lhs = .init(millimeters: lhs.millimeters * rhs.millimeters)
    }
    
    public static func /= (lhs: inout Self, rhs: Self) {
        lhs = .init(millimeters: lhs.millimeters / rhs.millimeters)
    }
    
}
