//
//  UserRowView.swift
//  Chirpr
//
//  Created by Valentin Silvera on 16/9/22.
//

import SwiftUI

struct UserRowView: View {
    var body: some View {
        HStack(spacing: 12) {
            Circle()
                .frame(width: 48)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("valentin")
                    .font(.subheadline)
                    .bold()
                
                Text("Valentin Silvera")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView()
    }
}
