//
//  AnimationInfo.swift
//  DPLibrary
//
//  Created by Дмитрий Поляков on 20.04.2021.
//

import Foundation
import UIKit

/// Struct for for defining basic animation properties.
///
public struct AnimationInfo {
    
    public let curve: UIView.AnimationCurve
    public let options: UIView.AnimationOptions
    public let duration: TimeInterval
    
    public init(curve: UIView.AnimationCurve, duration: TimeInterval) {
        self.curve = curve
        self.duration = duration
        
        switch curve {
        case .easeIn:
            self.options = .curveEaseIn
        case .easeOut:
            self.options = .curveEaseOut
        case .easeInOut:
            self.options = .curveEaseInOut
        case .linear:
            self.options = .curveLinear
        @unknown default:
            self.options = .curveLinear
        }
    }
}
