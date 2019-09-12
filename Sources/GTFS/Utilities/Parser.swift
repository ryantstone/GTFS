import Foundation
import CSV

public class Parser {

    private let decoder = JSONDecoder()

    public init() {}
    
    public func decodeFile<T: Decodable>(data: String, type: T.Type) throws -> [T] {
//        let parsedDict  = try parseCSV(data)
//        let json        = try JSONSerialization.data(withJSONObject: parsedDict, options: [])
//
//        return try decoder.decode([T].self, from: json)
        
        var rows = [T]()
        let reader = try CSVReader(string: data, hasHeaderRow: true)
        let decoder = CSVRowDecoder()
        while reader.next() != nil {
            guard let row = try? decoder.decode(T.self, from: reader) else { continue }
            rows.append(row)
        }
        
        return rows
    }
}
