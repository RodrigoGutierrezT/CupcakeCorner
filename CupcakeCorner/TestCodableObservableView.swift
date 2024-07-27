//
//  TestCodableObservableView.swift
//  CupcakeCorner
//
//  Created by Rodrigo on 27-07-24.
//

import SwiftUI

@Observable
class User: Codable {
    enum CodingKeys: String, CodingKey {
        case _name = "name"
    }
    
    var name = "Taylor"
}

struct TestCodableObservableView: View {
    var body: some View {
        Button("Encode Taylor", action: encodeTaylor)
    }
    
    func encodeTaylor() {
        let data = try! JSONEncoder().encode(User())
        let str = String(decoding: data, as: UTF8.self)
        print(str)
    }
}

#Preview {
    TestCodableObservableView()
}
