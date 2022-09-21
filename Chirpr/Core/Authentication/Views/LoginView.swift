//
//  LoginView.swift
//  Chirpr
//
//  Created by Valentin Silvera on 19/9/22.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationView {
            VStack {
                AuthHeaderView(title1: "Hello.", title2: "Welcome Back")
                
                VStack(spacing: 40) {
                    CustomInputFields(imageName: "envelope", placeholderText: "Email", text: $email)
                    
                    CustomInputFields(imageName: "lock", placeholderText: "Password", text: $password)
                }
                .padding(.horizontal, 32)
                .padding(.top, 44)
                
                HStack {
                    Spacer()
                    
                    NavigationLink {
                        Text("Reset password View")
                    } label: {
                        Text ("Forgot Password?")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(Color(.systemBlue))
                            .padding(.trailing, 24)
                    }
                }
                
                Button {
                    print("Sign in button pressed")
                } label: {
                    Text("Sign In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(radius: 10)
                
                Spacer()
                
                NavigationLink {
                    RegistrationView().toolbar(.hidden)
                } label: {
                    HStack {
                        Text("Don't have an account?")
                            .font(.footnote)
                        
                        Text("Sign Up")
                            .font(.footnote)
                            .fontWeight(.semibold)
                    }
                }
                .padding(.bottom, 32)
                .foregroundColor(Color(.systemBlue))
            }
            .ignoresSafeArea()
            .toolbar(.hidden)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
