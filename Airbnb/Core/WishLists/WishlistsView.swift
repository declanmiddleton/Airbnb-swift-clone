//
//  WishlistsView.swift
//  Airbnb
//
//  Created by Declan on 09/03/2025.
//

import SwiftUI

struct WishlistsView: View {
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading, spacing:32){
                VStack(alignment: .leading, spacing:20){
                    Text("Log in to see your wishlists")
                        .font(.headline)
                    
                    Text("You can create, view, and edit your wishlists from here once you have logged in")
                        .font(.footnote)
                    

                    Button(action: {}, label: {
                        Text("Login")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .frame(width: 360, height: 50)
                            .foregroundStyle(.primary)
                            .background(.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .foregroundStyle(.white)
                    })
                }
                .padding(.horizontal)

            }
            Spacer()
        }
        .padding()
        .navigationTitle("Wishlists")
    }
}

#Preview {
    WishlistsView()
}
