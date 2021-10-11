import Foundation

/// Enum for determining the screen offset.
///
public enum ScreenOffset {
    
    /// Height navigationBar.
    ///
    case heightNavigationBar
    
    /// Height statusBar.
    ///
    case heightStatusBar
    
    /// Height tabBar.
    ///
    case heightTabBar
    
    /// SafeArea insets top.
    ///
    case safeAreaInsetsTop
    
    /// SafeArea insets bottom.
    ///
    case safeAreaInsetsBottom
    
    /// Return screen offset value.
    /// - Parameter viewController: Screen offset for viewController.
    /// - Parameter whenNotHidden: When `true`, it returns the offset value for the element if it is not hidden or return 0.
    /// - Returns: Screen offset value.
    ///
    public func calculateValue(for viewController: UIViewController?, whenNotHidden: Bool = true) -> CGFloat {
        let value: CGFloat?
        
        switch self {
        case .heightNavigationBar:
            let navigationBar = viewController?.navigationController?.navigationBar
            let height = navigationBar?.frame.height
            
            if whenNotHidden {
                value = navigationBar?.isHidden == true ? .zero : height
            } else {
                value = height
            }
        case .heightStatusBar:
            let height = UIApplication.shared.statusBarFrame.height
            
            if whenNotHidden {
                value = viewController?.prefersStatusBarHidden == true ? .zero : height
            } else {
                value = height
            }
        case .heightTabBar:
            let tabBar = viewController?.tabBarController?.tabBar
            let height = tabBar?.frame.height
            
            if whenNotHidden {
                value = tabBar?.isHidden == true || viewController?.hidesBottomBarWhenPushed == true ? .zero : height
            } else {
                value = height
            }
        case .safeAreaInsetsTop:
            value =  UIApplication.shared.keyWindow?.safeAreaInsets.top
        case .safeAreaInsetsBottom:
            value =  UIApplication.shared.keyWindow?.safeAreaInsets.bottom
        }
        
        return value ?? .zero
    }
}

// MARK: - Array + ScreenOffset
public extension Array where Element == ScreenOffset {
    
    /// Return sum of screen offset values.
    /// - Parameter viewController: Screen offset for viewController.
    /// - Parameter whenNotHidden: When `true` return offset if offset for element not hidden or 0.
    /// - Returns: Sum of screen offset values.
    ///
    func calculateValue(for viewController: UIViewController?, whenNotHidden: Bool = true) -> CGFloat {
        self.reduce(0, { $0 + $1.calculateValue(for: viewController, whenNotHidden: whenNotHidden) })
    }
    
    /// Height navigationBar.
    ///
    static let heightNavigationBar: Self = [.heightNavigationBar]
    
    /// Height statusBab.
    ///
    static let heightStatusBar: Self = [.heightStatusBar]
    
    /// Height tabBar.
    ///
    static let heightTabBar: Self = [.heightTabBar]
    
    /// SafeArea insets top.
    ///
    static let safeAreaInsetsTop: Self = [.safeAreaInsetsTop]
    
    /// SafeArea insets bottom.
    ///
    static let safeAreaInsetsBottom: Self = [.safeAreaInsetsBottom]
    
    
    /// Height navigationBar + height statusBab.
    ///
    static let sumTopOffsets: Self = [.heightNavigationBar, .heightStatusBar]
}

// MARK: - UIViewController + ScreenOffset
public extension UIViewController {
    
    /// Return sum of screen offset values.
    /// - Parameter screenOffsets: Array of screen offsets.
    /// - Parameter whenNotHidden: When `true` return offset if offset for element not hidden or 0.
    /// - Returns: Sum of screen offset values.
    ///
    func getScreenOffsets(_ screenOffsets: [ScreenOffset], whenNotHidden: Bool = true) -> CGFloat {
        screenOffsets.calculateValue(for: self, whenNotHidden: whenNotHidden)
    }
    
}
