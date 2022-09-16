//
//  ChirpRowView.swift
//  Chirpr
//
//  Created by Valentin Silvera on 15/9/22.
//

import SwiftUI

struct ChirpRowView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 12) {
                Circle()
                    .frame(width: 56, height: 56)
                    .foregroundColor((Color.blue))
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack{
                        Text("Valentin Silvera")
                            .font(.subheadline).bold()
                        
                        Text("@valentin")
                            .foregroundColor(.gray)
                            .font(.caption)
                        
                        Text("2w")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    Text("Hello World!")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }
            }
            HStack {
                Button {
                    //action
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                }
                Spacer()
                Button {
                    //action
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                }
                Spacer()
                Button {
                    //action
                } label: {
                    Image(systemName: "heart")
                        .font(.subheadline)
                }
                Spacer()
                Button {
                    //action
                } label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                }
            }
            .padding()
            .foregroundColor(.gray)
        }
        .padding()
    }
}

struct ChirpRowView_Previews: PreviewProvider {
    static var previews: some View {
        ChirpRowView()
    }
}
