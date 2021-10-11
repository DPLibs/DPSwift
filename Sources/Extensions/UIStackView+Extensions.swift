import Foundation
import UIKit

public extension UIStackView {
    
    // MARK: - Subviews methods
    
    /// Add a views to the end of the arrangedSubviews list.
    /// - Parameter views: List of subviews for add.
    ///
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach({ self.addArrangedSubview($0) })
    }
    
}
