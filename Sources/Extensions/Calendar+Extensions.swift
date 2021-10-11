//
//  Calendar+Extensions.swift
//  DPLibrary
//
//  Created by Дмитрий Поляков on 20.04.2021.
//

import Foundation

public extension Calendar {
    
    /// Return `true` if self of this year.
    ///
    func isDateInYearNow(_ date: Date) -> Bool {
        self.component(.year, from: .init()) == self.component(.year, from: date)
    }
    
    /// Return `true` if self of this month.
    ///
    func isDateInMonthNow(_ date: Date) -> Bool {
        self.component(.month, from: .init()) == self.component(.month, from: date)
    }
    
}
