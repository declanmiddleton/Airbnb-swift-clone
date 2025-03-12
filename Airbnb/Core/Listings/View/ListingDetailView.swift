//
//  ListingDetailView.swift
//  Airbnb
//
//  Created by Declan on 28/02/2025.
//

import SwiftUI
import MapKit

struct ListingDetailView: View {
    var images = [
        "listing-1",
        "listing-2",
        "listing-3",
        "listing-4"

    ]
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ScrollView{
            ZStack (alignment: .topLeading){
                ListingImageCarouselView()
                    .frame(height: 320)
                
                Button(action: {dismiss()}, label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                        .background{
                            Circle()
                                .fill(.white)
                                .frame(width: 32, height: 32)
                        }
                        .padding(32)
                })
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Spacious Apartment in the Heart of New York City")
                    .font(.headline)
                
                Text("$2,500 / night")
                    .font(.caption)
                    .foregroundColor(.secondary)
                VStack(alignment: .leading){
                    HStack(spacing: 2){
                        Image(systemName: "star.fill")
                            .foregroundStyle(.black)

                        Text("4.83")
                            .foregroundStyle(.black)
                        Text(" - ")
                        Text("28 reviews")
                            .fontWeight(.semibold)
                            .underline()

                    }
                    Text("Auckland, New Zealand")

                    
                }
                .font(.caption)

            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider()
            
            // User Profile, Host info component
            HStack{
                VStack(alignment: .leading, spacing: 4){
                    Text("Entire villa hosted by john smith")
                        .font(.headline)
                        .frame(width: 250, alignment: .leading)
                    HStack(spacing: 2){
                        Text("4 guests -")
                        Text("4 bedrooms -")
                        Text("4 beds -")
                        Text("4 baths -")
                    }
                    .font(.caption)
                }
                .frame(width: 300, alignment: .leading)
                
                Spacer()
                Image("profile")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
            }
            .padding()
            
            Divider()
            // listing features
            VStack(alignment: .leading, spacing: 16){
                ForEach(0 ..< 2){feature in
                    HStack(spacing: 12){
                        Image(systemName: "medal")
                        VStack(alignment: .leading){
                            Text("Supershot")
                                .font(.footnote)
                                .fontWeight(.semibold)
                            Text("Superhosts are experienced, highly related travelers who consistently provide excellent experiences.")
                                .font(.footnote)
                                .foregroundStyle(.gray)
                        }
                        Spacer()
                    }
                   
                }
            }
            .padding()
            
            Divider()
            
            // Bedroom View
            VStack(alignment: .leading, spacing: 16){
                Text("Where you'll sleep")
                    .font(.headline)
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 16){
                        ForEach(1 ..< 5){bedroom in
                            VStack{
                              Image(systemName: "bed.double")
                                Text("Bedroom \(bedroom)")
                            }
                            .frame(width: 132, height: 100)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(lineWidth: 1)
                                    .foregroundColor(.gray)
                                    
                            )
                            
                            
                        }
                    }
                }
                .scrollTargetBehavior(.paging)
            }
            
            Divider()
            
            
            // What this place offers
            
            VStack(alignment: .leading, spacing: 16){
                Text("What this place offers")
                    .font(.headline)
                ForEach(0 ..< 5){feature in
                    HStack{
                        Image(systemName: "wifi")
                            .frame(width: 32)
                        Text("Wifi")
                            .font(.footnote)
                        Spacer()
                    }
                }
            }
            .padding()
            
            
            Divider()
            
            // Map
            VStack(alignment: .leading, spacing: 16){
                Text("Where you'll be")
                    .font(.headline)
                Map()
                    .frame(width: 360, height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding()
        }
        .toolbar(.hidden, for: .tabBar)
        .ignoresSafeArea()
        .padding(.bottom, 64)
        .overlay(alignment: .bottom){
            VStack{
                Divider()
                    .padding(.bottom)
                HStack{
                    VStack(alignment: .leading){
                        Text("$500")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            
                        Text("Total before taxes")
                            .font(.footnote)
                        Text("Oct 12 20")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .underline()

                    }
                    Spacer()
                    
                    
                    Button(action: {},label: {
                        Text("Rerseve")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 140, height:40)
                            .background(.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    })
                }
                .padding(.horizontal, 32)
            }
            .background(.white)
        }
    }
}

#Preview {
    ListingDetailView()
}
