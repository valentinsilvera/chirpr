//
//  SideMenuOptionRowView.swift
//  Chirpr
//
//  Created by Valentin Silvera on 16/9/22.
//

import SwiftUI

struct SideMenuOptionRowView: View {
    let sideMenuVM: SideMenuViewModel
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: sideMenuVM.imageName)
                .font(.headline)
                .foregroundColor(.gray)
            
            Text(sideMenuVM.title)
                .foregroundColor(.black)
                .font(.subheadline)
            
            Spacer()
        }
        .frame(height: 40)
        .padding(.horizontal)
    }
}

struct SideMenuOptionRowView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuOptionRowView(sideMenuVM: .profile)
    }
}
