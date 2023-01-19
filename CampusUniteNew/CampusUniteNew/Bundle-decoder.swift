import Foundation

extension Bundle{
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else{
            fatalError("Failed to locate the required file")
        }
        
        guard let data = try? Data(contentsOf: url) else{
            fatalError("Failed to load the required data")
        }
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode(T.self, from: data) else{
            fatalError("failed to decode")
        }
        
        return loaded
    }
}
