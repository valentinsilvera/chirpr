//
//  UserStatsView.swift
//  Chirpr
//
//  Created by Valentin Silvera on 16/9/22.
//

import SwiftUI

struct UserStatsView: View {
    var body: some View {
        HStack(spacing: 24) {
            HStack {
                Text("69")
                    .bold()
                
                Text("Following")
                    .foregroundColor(.gray)
            }
            
            HStack {
                Text("813")
                    .bold()
                
                Text("Followers")
                    .foregroundColor(.gray)
            }
        }
        .font(.subheadline)
    }
}

struct UserStatsView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatsView()
    }
}
