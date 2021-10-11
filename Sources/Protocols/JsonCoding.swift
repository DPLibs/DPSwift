import Foundation
import UIKit

/// Protocol for encoding `Json`.
///
public protocol JsonCoding {
    
    // MARK: - Typealias
    
    /// Typealias`Json` is `[String: Any]`.
    ///
    typealias Json = [String: Any]
    
    /// Typealias`JsonOfStrings` is `[String: String]`.
    ///
    typealias JsonOfStrings = [String: String]
    
    // MARK: - Props
    
    /// In case the `Self` is part of a custom `Json` returns the key or nil.
    ///
    var keyForCustomJson: String? { get }
    
    /// In case the `Self` is part of a custom `Json` returns the value or nil.
    ///
    var valueForCustomJson: Any? { get }
    
    // MARK: - Init
    
    /// Initialize  from data value.
    /// - Parameter data - Data value.
    ///
    init?(data: Data?)
    
    /// Initialize  from json value.
    /// - Parameter json - Json value.
    ///
    init?(json: Json?)
    
    /// Initialize  from string value.
    /// - Parameter string - String value.
    /// - Parameter encoding - String encoding.
    ///
    init?(string: String?, using encoding: String.Encoding)
    
    /// Initialize  from url value.
    /// - Parameter url - Url value.
    ///
    init?(url: URL?)
    
    /// Initialize  from url string value.
    /// - Parameter urlString - Url string value.
    ///
    init?(urlString: String?)
    
    // MARK: - Methods
    
    /// Returns all `Data` value or nil.
    /// - Returns: `Data` value or nil.
    ///
    func createJsonData() -> Data?
    
    /// Returns all `Json` value or nil.
    /// - Returns: `Json` value or nil.
    ///
    func createJsonDictionary() -> Json?
    
    /// Returns all `JsonOfStrings` value or nil.
    /// - Returns: `JsonOfStrings` value or nil.
    ///
    func createJsonOfStringsDictionary() -> JsonOfStrings?
    
    /// Returns all `String` value or nil.
    /// - Returns: `String` value or nil.
    ///
    func createJsonString() -> String?
}

// MARK: - JsonCoding + Codable
public extension JsonCoding where Self: Codable {
    
    var valueForCustomJson: Any? {
        guard let json = self.createJsonDictionary(), !json.isEmpty else { return self }
        
        return json
    }
    
    // MARK: - Init
    init?(data: Data?) {
        let decoder = JSONDecoder()

        guard
            let data = data,
            let object = try? decoder.decode(Self.self, from: data)
        else { return nil }

        self = object
    }
    
    init?(json: Json?) {
        guard
            let json = json,
            let data = try? JSONSerialization.data(withJSONObject: json, options: [])
        else { return nil }

        self.init(data: data)
    }
    
    init?(string: String?, using encoding: String.Encoding) {
        guard
            let string = string,
            let data = string.data(using: encoding)
        else { return nil }

        self.init(data: data)
    }
    
    init?(url: URL?) {
        guard
            let url = url,
            let data = try? Data(contentsOf: url)
        else { return nil }

        self.init(data: data)
    }
    
    init?(urlString: String?) {
        guard let urlString = urlString else { return nil }

        self.init(url: URL(string: urlString))
    }
    
    // MARK: - Methods
    func createJsonData() -> Data? {
        let encoder = JSONEncoder()
        guard let result = try? encoder.encode(self) else { return nil }

        return result
    }
    
    func createJsonDictionary() -> Json? {
        guard let data = self.createJsonData() else { return nil }

        let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
        let result = json.flatMap { $0 as? Json }

        return result
    }
    
    func createJsonOfStringsDictionary() -> JsonOfStrings? {
        guard let json = self.createJsonDictionary() else { return nil }

        var result: [String: String] = [:]
        json.forEach({ result[$0.key] = ($0.value as AnyObject).description })

        return result
    }
    
    func createJsonString() -> String? {
        guard
            let data = self.createJsonData(),
            let result = String(data: data, encoding: .utf8)
        else { return nil }

        return result
    }
    
}


