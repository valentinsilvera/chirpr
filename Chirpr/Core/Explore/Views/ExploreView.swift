//
//  ExploreView.swift
//  Chirpr
//
//  Created by Valentin Silvera on 15/9/22.
//

import SwiftUI

struct ExploreView: View {
    @ObservedObject var viewModel = ExploreViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.users) { user in
                            NavigationLink {
                                ProfileView(user: user)
                            } label: {
                                UserRowView(user: user)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
