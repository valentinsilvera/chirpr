//
//  SideMenuView.swift
//  Chirpr
//
//  Created by Valentin Silvera on 16/9/22.
//

import SwiftUI

struct SideMenuView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        if let user = viewModel.currentUser {
            
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading) {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 48, height: 48)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(user.fullname)
                            .font(.headline)
                        
                        Text("@\(user.username)")
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
                            ProfileView(user: user)
                        } label: {
                            SideMenuOptionRowView(sideMenuVM: vm)
                        }
                    } else if vm == .logout {
                        Button {
                            viewModel.signOut()
                        } label: {
                            SideMenuOptionRowView(sideMenuVM: vm)
                        }
                    } else {
                        SideMenuOptionRowView(sideMenuVM: vm)
                    }
                }
                Spacer()
            }
        } else {
            Text("Can't find a user")
        }
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
