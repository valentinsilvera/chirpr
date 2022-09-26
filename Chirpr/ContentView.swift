//
//  ContentView.swift
//  Chirpr
//
//  Created by Valentin Silvera on 15/9/22.
//

import SwiftUI

struct ContentView: View {
    @State private var showMenu = false
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            Group {
                if viewModel.userSession == nil {
                    LoginView()
                } else {
                    mainInterfaceView
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    var mainInterfaceView: some View {
        ZStack(alignment: .topLeading) {
            MainTabView()
                .toolbar(showMenu ? .hidden : .visible)
            
            if showMenu {
                ZStack {
                    Color(.black)
                        .opacity(showMenu ? 0.25 : 0.0)
                }.onTapGesture {
                    withAnimation(.easeInOut) {
                        showMenu = false
                    }
                }
                .ignoresSafeArea()
            }
            
            Color(.white)
                .ignoresSafeArea()
                .frame(width: 300)
                .offset(x: showMenu ? 0: -300, y: 0)
            
            SideMenuView()
                .frame(width: 300)
                .offset(x: showMenu ? 0: -300, y: 0)
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                if let _ = viewModel.currentUser {
                    Button {
                        withAnimation(.easeInOut) {
                            showMenu.toggle()
                        }
                    } label: {
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .frame(width: 32, height: 32)
                    }
                }
            }
        }
        .onAppear {
            showMenu = false
        }
    }
}
