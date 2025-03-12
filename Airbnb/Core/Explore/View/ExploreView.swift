//
//  ExploreView.swift
//  Airbnb
//
//  Created by Declan on 28/02/2025.
//

import SwiftUI

struct ExploreView: View {
    @State private var showDestinationSearchView = false
    @StateObject var viewModel = ExploreViewModel(service: ExploreService())
    var body: some View {
        
        
        if showDestinationSearchView{
            DestinationSearchView(show: $showDestinationSearchView)
        } else{
            NavigationStack{
                ScrollView{
                    SearchAndFilterBar()
                        .onTapGesture {
                            withAnimation(.snappy){
                                showDestinationSearchView.toggle()
                            }
                        }
                    // Lazy loading
                    LazyVStack(spacing: 32){
                        ForEach(viewModel.listings, id: \.self){listing in
                            NavigationLink(value: listing) {
                                ListingItemView(listing: listing)
                            }
                        }
                        
                    }
                }
                
                .navigationDestination(for: Int.self) { listing in
                    ListingDetailView()
                        .navigationBarHidden(true)
                        
                }
            }
        }
      
    }
}

#Preview {
    ExploreView()
}
