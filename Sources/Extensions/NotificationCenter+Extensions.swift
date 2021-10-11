import Foundation

public extension NotificationCenter {
    
    // MARK: - Observer methods
    
    /// Adds an entries to the notification center to call the provided selector with the notification.
    /// - Parameter observer: An object to register as an observer.
    /// - Parameter selector: A selector that specifies the message the receiver sends observer to alert it to the notification posting. The method that aSelector specifies must have one and only one argument (an instance of NSNotification).
    /// - Parameter notifiacations: The names of the notification to register for delivery to the observer. Specify a notification name to deliver only entries with this notification name.
    ///
    func addObservers(_ observer: Any, selector: Selector, notifiacations: [Notification.Name]) {
        notifiacations.forEach({ name in
            self.addObserver(observer, selector: selector, name: name, object: nil)
        })
    }
    
}
