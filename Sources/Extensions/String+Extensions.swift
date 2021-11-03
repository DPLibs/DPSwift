import Foundation

public extension String {
    
    // MARK: - Capitalize methods
    
    /// Return string with capitalizing first letter.
    /// - Returns: String with capitalizing first letter.
    ///
    func capitalizingFirstLetter() -> String {
        self.prefix(1).capitalized + self.dropFirst()
    }

    /// Capitalize first letter in the string.
    ///
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
    
    // MARK: - Random methods
    
    /// Return string of random characters with current length.
    /// - Parameter length: String length.
    /// - Returns: Random string.
    ///
    static func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 "
        var characters: [Character] = []
        
        (0..<length).forEach({ _ in
            guard let character = letters.randomElement() else { return }
            characters += [character]
        })
        
        return String(characters)
    }
    
}
