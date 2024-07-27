//
//  TestDisablingFormsView.swift
//  CupcakeCorner
//
//  Created by Rodrigo on 26-07-24.
//

import SwiftUI

struct TestDisablingFormsView: View {
    
    @State private var name = ""
    @State private var email = ""
    
    var disableForm: Bool {
        name.count < 3 || email.count < 5
    }
    
    var body: some View {
        Form {
            Section {
                TextField("name", text: $name)
                TextField("email", text: $email)
            }
            
            Section {
                Button("Create Account") {
                    print("Creating account")
                }
            }
            .disabled(disableForm)
        }
    }
}

#Preview {
    TestDisablingFormsView()
}
