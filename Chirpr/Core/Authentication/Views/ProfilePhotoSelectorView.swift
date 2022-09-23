//
//  ProfilePhotoSelectorView.swift
//  Chirpr
//
//  Created by Valentin Silvera on 22/9/22.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    var body: some View {
        VStack {
            AuthHeaderView(title1: "Create your account.",
                           title2: "Add a profile photo")
            
            Spacer()
            
            Button {
                return
            } label: {
                VStack {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .padding(.bottom)
                    
                    Text("Select photo...")
                        .font(.headline)
                }
            }
            
            Spacer()
        }
        .ignoresSafeArea()
    }
}

struct PhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
