//
//  TestAsyncImageView.swift
//  CupcakeCorner
//
//  Created by Rodrigo on 26-07-24.
//

import SwiftUI

struct TestAsyncImageView: View {
    var body: some View {
        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
            } else if phase.error != nil {
                Text("Error loading the image")
            } else {
                ProgressView()
            }
        }
        .frame(width: 200, height: 200)
    }
}

#Preview {
    TestAsyncImageView()
}
