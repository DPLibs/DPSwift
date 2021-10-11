import Foundation
import UIKit

public extension UIView {
    
    // MARK: - Image methods
    
    /// Creates an image based on a view.
    /// - Parameter size: Created image size.
    /// - Parameter fillColor: Created image fill color, default - `UIColor.white`.
    /// - Returns: Created image.
    ///
    func toImage(size: CGSize, fillColor: UIColor = .white) -> UIImage? {
        self.bounds = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, self.isOpaque, UIScreen.main.scale)
        
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        context.setFillColor(fillColor.cgColor)
        context.fill(CGRect(origin: .zero, size: size))
        self.layer.render(in: context)
        
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return img
    }
    
    /// Creates an image based on a view wirh size equal bounds size.
    /// - Parameter fillColor: Created image fill color, default - `UIColor.white`.
    /// - Returns: Created image.
    ///
    func toImageWithBoundsSize(fillColor: UIColor = .white) -> UIImage? {
        self.toImage(size: self.bounds.size, fillColor: fillColor)
    }
    
    // MARK: - Coordinate metods
    
    /// Get absolute coordinates in a superview.
    ///
    func getAbsoluteCoordinateInSuperview() -> CGRect? {
        self.superview?.convert(self.frame, to: nil)
    }
    
    // MARK: - Layouts methods
    
    /// Perform `setNeedsLayout()` and `layoutIfNeeded()`.
    ///
    func reloadLayouts() {
        self.setNeedsLayout()
        self.layoutIfNeeded()
    }
    
    // MARK: - Animate methods

    /// Start rotate.
    /// - Parameter duration: Duration value.
    /// - Parameter repeatCount: Repaet value.
    ///
    func startRotationAnimation(duration: TimeInterval = 1, repeatCount: Float = .infinity) {
        let kRotationAnimationKey = "rotation_animation_key"
        
        guard self.layer.animation(forKey: kRotationAnimationKey) == nil else { return }
        
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.fromValue = 0.0
        rotationAnimation.toValue = Float.pi * 2.0
        rotationAnimation.duration = duration
        rotationAnimation.repeatCount = repeatCount

        self.layer.add(rotationAnimation, forKey: kRotationAnimationKey)
    }

    /// Stop rotate.
    ///
    func stopRotationAnimation() {
        let kRotationAnimationKey = "rotation_animation_key"
        
        guard self.layer.animation(forKey: kRotationAnimationKey) != nil else { return }
        self.layer.removeAnimation(forKey: kRotationAnimationKey)
    }
    
}
