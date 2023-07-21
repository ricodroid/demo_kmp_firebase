//
//  LoginView.swift
//  iosApp
//
//  Created by Sarah Brenner on 7/21/23.
//  Copyright © 2023 orgName. All rights reserved.
//

import SwiftUI

struct LoginViewBody: View {
    @Binding var login: String
    @Binding var password: String
    let isButtonEnabled: Bool
    let isLoading: Bool
    let onLoginPressed: () -> Void
    
    var body: some View {
        VStack(spacing: 8.0) {
            TextField("Login", text: $login)
                .textFieldStyle(.roundedBorder)
                .disabled(isLoading)
            
            TextField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
                .disabled(isLoading)
            
            if isLoading {
                ProgressView()
            } else {
                Button("Login") {
                    onLoginPressed()
                }.disabled(!isButtonEnabled)
            }
        }.padding()
    }
}


struct LoginView_Previews: PreviewProvider {
    struct Preview: View {
        var body: some View {
            LoginViewBody(
                login: State(initialValue: "").projectedValue,
                password: State(initialValue: "").projectedValue,
                isButtonEnabled: false,
                isLoading: false,
                onLoginPressed: {}
            )
            LoginViewBody(
                login: State(initialValue: "test").projectedValue,
                password: State(initialValue: "pass").projectedValue,
                isButtonEnabled: true,
                isLoading: false,
                onLoginPressed: {}
            )
            LoginViewBody(
                login: State(initialValue: "test").projectedValue,
                password: State(initialValue: "pass").projectedValue,
                isButtonEnabled: false,
                isLoading: true,
                onLoginPressed: {}
            )
        }
    }
    
    static var previews: some View {
        Group {
            Preview()
        }.previewDisplayName("Light theme")
            .preferredColorScheme(.light)
        
        Group {
            Preview()
        }.previewDisplayName("Dark theme")
            .preferredColorScheme(.dark)
    }
}
