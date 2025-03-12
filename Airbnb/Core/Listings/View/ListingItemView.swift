//
//  ListingItemView.swift
//  Airbnb
//
//  Created by Declan on 28/02/2025.
//

import SwiftUI

struct ListingItemView: View {
    let listing: Listing
    var body: some View {
        VStack(spacing: 8){
            // images
            ListingImageCarouselView()
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            
            
            //listing details
            HStack(alignment: .top){
                // details
                VStack(alignment: .leading){
                    Text("\(listing.city), \(listing.state)")
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                    Text("12 mi away")
                        .foregroundStyle(.gray)
                    Text("Dec 10 - 10")
                        .foregroundStyle(.gray)
                    HStack(spacing: 4){
                        Text("\(listing.pricePerNight)")
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                        Text("night")
                            .foregroundStyle(.black)

                    }
                }
                Spacer()
                
                // rating
                HStack(spacing: 2){
                    Image(systemName: "star.fill")
                        .foregroundStyle(.black)

                    Text("\(listing.rating)")
                        .foregroundStyle(.black)

                }
            }
            .font(.footnote)
        }
        .padding()
    }
}

#Preview {
    ListingItemView(listing: DeveloperPreview.shared.listings[0])
}
