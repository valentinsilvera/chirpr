//
//  RegistrationView.swift
//  Chirpr
//
//  Created by Valentin Silvera on 19/9/22.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var username = ""
    @State private var fullname = ""
    @State private var password = ""
    
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            VStack {
                AuthHeaderView(title1: "Get Started.",
                               title2: "Create your account")
            }
            .ignoresSafeArea()
            
            VStack(spacing: 40) {
                CustomInputFields(imageName: "envelope", placeholderText: "Email", text: $email)
                
                CustomInputFields(imageName: "person",
                                  placeholderText: "Username",
                                  text: $username)
                
                CustomInputFields(imageName: "person",
                                  placeholderText: "Display Name",
                                  text: $fullname)
                
                CustomInputFields(imageName: "lock",
                                  placeholderText: "Password",
                                  isSecureField: true,
                                  text: $password)
            }
            .padding(.horizontal, 32)
            .padding(.bottom, 44)
            
            Button {
                viewModel.register(withEmail: email,
                                   password: password,
                                   fullname: fullname,
                                   username: username)
            } label: {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(radius: 10)
            
            Spacer()
            
            Button {
                dismiss()
            } label: {
                HStack {
                    Text("Already have an account?")
                        .font(.footnote)
                    
                    Text("Sign In")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
