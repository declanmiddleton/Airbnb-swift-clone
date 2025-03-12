//
//  MainTabView.swift
//  Airbnb
//
//  Created by Declan on 09/03/2025.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView{
            ExploreView()
                .tabItem({Label("Explore", systemImage: "magnifyingglass")})
            
            WishlistsView()
                .tabItem({Label("Wishlists", systemImage: "heart")})

            
            ProfileView()
                .tabItem({Label("Explore", systemImage: "person")})

        }
    }
}

#Preview {
    MainTabView()
}
