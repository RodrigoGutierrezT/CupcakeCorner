//
//  Order.swift
//  CupcakeCorner
//
//  Created by Rodrigo on 27-07-24.
//

import Foundation

@Observable
class Order: Codable {
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "lastOrder") {
            if let decodedOrder = try? JSONDecoder().decode(Order.self, from: savedItems) {
                name = decodedOrder.name
                streetAddress = decodedOrder.streetAddress
                city = decodedOrder.city
                zip = decodedOrder.zip
                
                return
            }
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case _type = "type"
        case _quantity = "quantity"
        case _specialRequestEnabled = "specialRequestEnabled"
        case _extraFrosting = "extraFrosting"
        case _addSprinkles = "addSprinkles"
        case _name = "name"
        case _streetAddress = "streetAddress"
        case _city = "city"
        case _zip = "zip"
    }
    
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow" ]
    
    var type = 0
    var quantity = 3
    
    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    
    var extraFrosting = false
    var addSprinkles = false
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    var hasValidAddress: Bool {
        if name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty 
            || streetAddress.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            || city.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            || zip.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            
            return false
        }
        
        return true
    }
    
    var cost: Decimal {
        // 2$ per cake
        var cost = Decimal(quantity) * 2
        
        // complicated cakes cost more
        cost += Decimal(type) / 2
        
        // $1/cake for extra frostring
        if extraFrosting {
            cost += Decimal(quantity)
        }
        
        // $0.50/cake for sprinkles
        if addSprinkles {
            cost += Decimal(quantity) / 2
        }
        
        return cost
    }
}

