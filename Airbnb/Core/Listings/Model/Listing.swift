//
//  Listing.swift
//  Airbnb
//
//  Created by Declan on 09/03/2025.
//

import Foundation


struct Listing: Identifiable, Codable, Hashable{
    let id: String
    let OwnerUid: String
    let ownerImageUrl: String
    let ownerName: String
    let numberOfBedrooms: Int
    let numberOfBathrooms: Int
    let numberOfGuests: Int
    var pricePerNight: Int
    let numberOfBeds: Int
    let latitude: Double
    let longitude: Double
    var imageUrls: [String]
    let address: String
    let city: String
    let state: String
    let title: String
    var rating: Double
    var features: [ListingFeatures]
    var amenities: [ListingAmmenities]
    let type: ListingType
}


enum ListingFeatures: Int, Codable, Identifiable, Hashable{
    case selfCheckIn
    case superHost
    var id: Int {return self.rawValue}
    
    
    var imageName: String{
        switch self{
        case .selfCheckIn: return "door.left.hand.open"
        case .superHost: return "medal"
        }
    }
    var title: String{
        switch self{
        case .selfCheckIn: return "Self Check in"
        case .superHost: return "Superhost"
        }
    }
    var subtitle: String{
        switch self{
            case .selfCheckIn: return "Check yourself in with the key pad"
            case .superHost: return "Superhosts are experienced hosts who have consistently received positive reviews from guests"
        }
    }
}

enum ListingAmmenities: Int, Codable, Identifiable, Hashable{
    case pool
    case kitchen
    case wifi
    case laundry
    case tv
    case alarmSystem
    case office
    case balcony

    var title: String{
        switch self{
            case .pool: return "Pool"
            case .kitchen: return "Kitchen"
            case .wifi: return "Wifi"
            case .laundry: return "Laundry"
            case .tv: return "Tv"
            case .alarmSystem: return "Alarm System"
            case .office: return "Office"
            case .balcony: return "Balcony"
        }
    }
    
    var imageName:String {
        switch self{
            case .pool: return "figure.pool.swim"
            case .kitchen: return "fork.knife"
            case .wifi: return "wifi"
            case .laundry: return "washer"
            case .tv: return "tv"
            case .alarmSystem: return "checkerboard.shield"
            case .office: return "pencil.and.ruler.fill"
            case .balcony: return "building"
        }
    }
    
    var id: Int {return self.rawValue}

}

enum ListingType: Int, Codable, Identifiable, Hashable{
    case apartment
    case house
    case townhouse
    case villa
    var description: String{
        switch self{
        case .apartment: return "Apartment"
        case .house: return "House"
        case .townhouse: return "Townhouse"
        case .villa: return "Villa"
        }
    }
    var id: Int {return self.rawValue}

}
