//
//  CustomInputFields.swift
//  Chirpr
//
//  Created by Valentin Silvera on 20/9/22.
//

import SwiftUI

struct CustomInputFields: View {
    let imageName: String
    let placeholderText: String
    var isSecureField: Bool = false
    
    @State private var showPassword: Bool = false
    @Binding var text: String
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.darkGray))
                
                if isSecureField == true {
                    if showPassword {
                        // TextFields and SecureFields have different sizes so there's a padding() used as a hack, still not perfect
                        TextField(placeholderText,
                                  text: $text)
                        .padding(.bottom, 1)
                    } else {
                        SecureField(placeholderText,
                                    text: $text)
                        .padding(.bottom, 2)
                    }
                    
                    Button(action: { self.showPassword.toggle()}) {
                        if showPassword {
                            Image(systemName: "eye.slash")
                        } else {
                            Image(systemName: "eye")
                        }
                    }
                    .foregroundColor(Color(.gray))
                    .padding(.bottom, 4)
                    
                } else {
                    TextField(placeholderText,
                              text: $text)
                }
            }
            
            Divider()
                .background(Color(.darkGray))
        }
    }
}

struct CustomInputFields_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputFields(imageName: "envelope",
                          placeholderText: "Email",
                          text: .constant(""))
    }
}
