import Foundation

public extension FileManager {
    
    // MARK: - Temporary url methods
    
    /// Creates a temporary url with necessary  file name and file extension.
    /// - Parameter fileName: Required file name.
    /// - Parameter fileExtension: Required file extension.
    /// - Returns: Temporary url.
    ///
    func createTempUrl(fileName: String, fileExtension: String) -> URL {
        URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(fileName).appendingPathExtension(fileExtension)
    }
    
    // MARK: - Save methods
    
    /// Saves the file to url.
    /// - Parameter data: File data.
    /// - Parameter url: Save url.
    /// - Returns: Url to the saved file.
    ///
    func saveFile(_ data: Data?, toUrl url: URL) -> URL? {
        guard let data = data, (try? data.write(to: url)) != nil else { return nil }
        return url
    }
    
    /// Saves the file to temporary url.
    /// - Parameter data: File data.
    /// - Parameter fileName: Required file name.
    /// - Parameter fileExtension: Required file extension.
    /// - Returns: Url to the saved file.
    ///
    func saveFileToTempUrl(_ data: Data?, fileName: String, fileExtension: String) -> URL? {
        self.saveFile(data, toUrl: self.createTempUrl(fileName: fileName, fileExtension: fileExtension))
    }
    
    // MARK: - Remove methods
    
    /// Removed  file by url.
    /// - Parameter url: Url to file.
    ///
    func removeFileByUrl(_ url: URL?) {
        guard let url = url, url.isFileURL, self.fileExists(atPath: url.path) else { return }
        try? self.removeItem(at: url)
    }
    
    /// Removed  files by urls.
    /// - Parameter urls: Urls to files.
    ///
    func removeFilesByUrls(_ urls: [URL?]) {
        urls.forEach({ self.removeFileByUrl($0) })
    }
    
}
