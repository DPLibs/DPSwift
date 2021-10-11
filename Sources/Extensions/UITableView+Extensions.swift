import Foundation
import UIKit

public extension UITableView {
    
    // MARK: - Cells methods
    
    /// Registers tableCells classes in the tableView.
    /// - Parameter cellClasses - Registered tableCells classes.
    ///
    func registerCellNibs(_ cellClasses: [AnyClass]) {
        cellClasses.forEach({ cellClass in
            let identifier = NSStringFromClass(cellClass).components(separatedBy: ".").last ?? ""
            let nib = UINib(nibName: identifier, bundle: nil)
            self.register(nib, forCellReuseIdentifier: identifier)
        })
    }
    
}
