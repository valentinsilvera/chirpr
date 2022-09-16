//
//  SideMenuView.swift
//  Chirpr
//
//  Created by Valentin Silvera on 16/9/22.
//

import SwiftUI

struct SideMenuView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            VStack(alignment: .leading) {
                Circle()
                    .frame(width: 48)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Valentin Silvera")
                        .font(.headline)
                    
                    Text("@valentin")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                UserStatsView()
                    .padding(.vertical)
            }
            .padding(.horizontal)
            
            ForEach(SideMenuViewModel.allCases, id: \.rawValue) { vm in
                if vm == .profile {
                    NavigationLink {
                        ProfileView()
                    } label: {
                        SideMenuOptionRowView(sideMenuVM: vm)
                    }
                } else if vm == .logout {
                    SideMenuOptionRowView(sideMenuVM: vm)
                } else {
                    SideMenuOptionRowView(sideMenuVM: vm)
                }
            }
            Spacer()
        }
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
