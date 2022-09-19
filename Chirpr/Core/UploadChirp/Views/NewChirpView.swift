//
//  NewChirpView.swift
//  Chirpr
//
//  Created by Valentin Silvera on 17/9/22.
//

import SwiftUI

struct NewChirpView: View {
    @State private var caption = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundColor(Color(.systemBlue))
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("Chirp")
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }
            }
            .padding()
            
            HStack(alignment: .top) {
                Circle()
                    .frame(width: 64)
                
                TextArea("What's happening", text: $caption)
            }
            .padding()
        }
    }
}

struct NewChirpView_Previews: PreviewProvider {
    static var previews: some View {
        NewChirpView()
    }
}
