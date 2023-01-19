import Foundation
import SwiftUI

struct University: Codable, Identifiable{
    var id: Int
    
    let name: String
    let abbreviation: String
    let location:  String
    let description: String
    
    var image: String{
        "\(abbreviation)"
    }

}
