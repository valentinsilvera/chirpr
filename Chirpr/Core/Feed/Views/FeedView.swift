//
//  FeedView.swift
//  Chirpr
//
//  Created by Valentin Silvera on 15/9/22.
//

import SwiftUI

struct FeedView: View {
    @State private var showNewChirpView = false
    @ObservedObject var viewModel = FeedViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.chirps) { chirp in
                        ChirpRowView(chirp: chirp)
                        Divider()
                    }
                }
            }
            
            Button {
                showNewChirpView.toggle()
            } label: {
                ZStack {
                    Circle().frame(height: 55)
                        .foregroundColor(Color(.systemBlue))
                    
                    Image(systemName: "quote.bubble")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 28, height: 28)
                        .foregroundColor(.white)
                        .offset(y:1)
                }
            }
            .padding()
            .fullScreenCover(isPresented: $showNewChirpView) {
                NewChirpView()
            }
        }
        .refreshable {
            viewModel.fetchChirps()
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
