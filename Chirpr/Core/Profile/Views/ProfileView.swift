//
//  ProfileView.swift
//  Chirpr
//
//  Created by Valentin Silvera on 16/9/22.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectedFilter: ChirpFilterViewModel = .chirps
    @Environment(\.dismiss) var dismiss
    @Namespace var animation
    
    var body: some View {
        VStack(alignment: .leading) {
            headerView
            
            actionButtons
            
            userInfoDetails
            
            chirpFilterBar
            
            chirpsView
            
            Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

extension ProfileView {
    var headerView: some View {
        ZStack(alignment: .bottomLeading) {
            Color(.systemBlue)
                .ignoresSafeArea()
            
            VStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                        .offset(x:0, y: 0)
                }
                
                Circle()
                    .frame(width: 80, height: 80)
                    .offset(x: 16, y: 24)
            }
        }
        .frame(height: 120)
    }
    
    var actionButtons: some View {
        HStack(spacing: 20) {
            Spacer()
            
            Image(systemName: "bell.badge")
                .font(.title3)
                .padding(6)
                .overlay(Circle().stroke(Color.gray, lineWidth: 1))
            
            Button {
                
            } label: {
                Text("Edit Profile")
                    .foregroundColor(.black)
                    .font(.subheadline).bold()
                    .frame(width: 120, height: 36)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 1))
            }
        }
        .padding(.trailing)
    }
    
    var userInfoDetails: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text("Valentin Silvera")
                    .font(.title2).bold()
                
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color(.systemBlue))
            }
            
            Text("@valentin")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("Yet another iOS developer 🍎 I made this app because I was bored")
                .font(.subheadline)
                .padding(.vertical)
            
            HStack(spacing: 24) {
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                    
                    Text("Barcelona")
                }
                
                HStack {
                    Image(systemName: "link")
                    
                    Text("https://valentin.work")
                }
            }
            .font(.caption)
            .foregroundColor(.gray)
            
            UserStatsView()
            .padding(.vertical)
        }
        .padding(.horizontal)
    }
    
    var chirpFilterBar: some View {
        HStack {
            ForEach(ChirpFilterViewModel.allCases, id: \.rawValue) { item in
                VStack {
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectedFilter == item ? .semibold : .regular)
                        .foregroundColor(selectedFilter == item ? .black : .gray)
                    
                    if selectedFilter == item {
                        Capsule()
                            .foregroundColor(Color(.systemBlue))
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "filter", in: animation)
                    } else {
                        Capsule()
                            .foregroundColor(Color(.clear))
                            .frame(height: 3)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selectedFilter = item
                    }
                }
            }
        }
        .overlay(Divider().offset(x: 0, y: 16))
    }
    
    var chirpsView: some View {
        ScrollView {
            LazyVStack {
                ForEach(0 ... 9, id: \.self) { _ in
                    ChirpRowView()
                    
                    Divider()
                }
            }
        }
    }
}
