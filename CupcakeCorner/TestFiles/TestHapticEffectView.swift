//
//  TestHapticEffectView.swift
//  CupcakeCorner
//
//  Created by Rodrigo on 27-07-24.
//

import SwiftUI

struct TestHapticEffectView: View {
    @State private var counter = 0
    
    var body: some View {
        Button("Tap Count: \(counter)") {
            counter += 1
        }
        .sensoryFeedback(.increase, trigger: counter)
    }
}

#Preview {
    TestHapticEffectView()
}
