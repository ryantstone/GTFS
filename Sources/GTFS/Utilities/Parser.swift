import Foundation
import SwiftCSV

public class Parser {

    private let decoder = JSONDecoder()

    public init() {}
    
    public func decodeFile<T: Codable>(data: String, type: T.Type) throws -> [T] {
        let parsedDict  = try parseCSV(data)
        let json        = try JSONSerialization.data(withJSONObject: parsedDict, options: [])
        
        return try decoder.decode([T].self, from: json)
    }

    private func parseCSV(_ data: String) throws -> [[String: String]]{
        return try CSV(string: data).namedRows
    }
}
