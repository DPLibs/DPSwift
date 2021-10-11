import Foundation

/// Struct for defining the application remote server configuration.
///
public struct AppServerConfiguration {
    
    /// Url string with a port for defining a rest server url. Example: `httр://example.com:8000`.
    ///
    public let restUrl: String
    
    /// Url string with a port for defining a socket server url. Example: `wss://example.com:8001`.
    ///
    public let socketUrl: String
    
    /// Server configuration target. Example: `D` (develop server).
    ///
    public let target: String
    
    /// Default initialize.
    /// - Parameter restUrl - Url string with a port for defining a rest server url. Example: `http://example.com:8000`.
    /// - Parameter socketUrl - Url string with a port for defining a socket server url. Example: `wss://example.com:8001`.
    /// - Parameter target - Server configuration target. Example: `D` (develop server).
    ///
    public init(restUrl: String, socketUrl: String, target: String) {
        self.restUrl = restUrl
        self.socketUrl = socketUrl
        self.target = target
    }
}
