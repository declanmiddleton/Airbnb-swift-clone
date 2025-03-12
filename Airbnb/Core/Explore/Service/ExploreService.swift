//
//  ExploreService.swift
//  Airbnb
//
//  Created by Declan on 12/03/2025.
//

import Foundation


class ExploreService{
    func fetchExploreData() async throws -> [Listing] {
        return DeveloperPreview.shared.listings
    }
}
