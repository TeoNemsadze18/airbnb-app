//
//  AirbnbListingsResponse.swift
//  airbnb
//
//  Created by teona nemsadze on 12.10.23.
//

import Foundation

struct AirbnbListingsResponse: Codable {
    let total_count: Int
    let results: [AirbnbListing]
}
