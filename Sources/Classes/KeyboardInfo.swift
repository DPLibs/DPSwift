//
//  KeyboardInfo.swift
//  DPLibrary
//
//  Created by Дмитрий Поляков on 20.04.2021.
//

import Foundation
import UIKit

/// Struct contains basic information about the appearance / disappearance of the keyboard, which it receives from keyboard notifications.
///
public struct KeyboardInfo {
    
    public let animationInfo: AnimationInfo
    public let isLocal: Bool
    public let frameBegin: CGRect
    public let frameEnd: CGRect
    
    public init?(_ notification: Notification) {
        let expectedNotifications = [
            UIResponder.keyboardWillShowNotification,
            UIResponder.keyboardWillHideNotification,
            UIResponder.keyboardWillChangeFrameNotification,
            UIResponder.keyboardDidShowNotification,
            UIResponder.keyboardDidHideNotification,
            UIResponder.keyboardDidChangeFrameNotification
        ]
        
        guard
            expectedNotifications.contains(notification.name),
            let userInfo = notification.userInfo,
            let animationCurveRawValue = userInfo[UIWindow.keyboardAnimationCurveUserInfoKey] as? Int,
            let animationCurve = UIView.AnimationCurve(rawValue: animationCurveRawValue),
            let animationDuration = userInfo[UIWindow.keyboardAnimationDurationUserInfoKey] as? Double,
            let isLocal = userInfo[UIWindow.keyboardIsLocalUserInfoKey] as? Bool,
            let frameBegin = userInfo[UIWindow.keyboardFrameBeginUserInfoKey] as? CGRect,
            let frameEnd = userInfo[UIWindow.keyboardFrameEndUserInfoKey] as? CGRect
        else { return nil }

        self.animationInfo = .init(curve: animationCurve, duration: animationDuration)
        self.isLocal = isLocal
        self.frameBegin = frameBegin
        self.frameEnd = frameEnd
    }
}
