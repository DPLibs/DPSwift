import Foundation

/// Enum for determining the application version.
///
public enum AppVersion {
    
    /// Returns application short version with build number. Example: `1.0.0.0`.
    ///
    public static var full: String? {
        guard let version = self.short, let buildNumber = self.buildNumber else { return nil }
        return "\(version).\(buildNumber)"
    }
    
    /// Returns application short version. Example: `1.0.0`.
    ///
    public static var short: String? {
        Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }
    
    /// Returns build number. Example: `1`.
    ///
    public static var buildNumber: String? {
        Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String
    }
    
}
