//
//  ExploreViewModel.swift
//  Airbnb
//
//  Created by Declan on 12/03/2025.
//

import Foundation

class ExploreViewModel: ObservableObject{
    @Published var listings = [Listing]()
    private let service: ExploreService
    
    
    init(service: ExploreService){
        self.service = service
        
        Task {await fetchListings()}
    }
    
    func fetchListings() async{
        do{
            self.listings = try await self.service.fetchExploreData()
        } catch{
            print("error: \(error.localizedDescription)")
        }
    }
}
