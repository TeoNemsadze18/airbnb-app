//
//  AirbnbListingsView.swift
//  airbnb
//
//  Created by teona nemsadze on 12.10.23.
//

import Foundation
final class AirbnbListingsViewViewModel: ObservableObject {
     private let service = APIService()
    
    @Published var listings: [AirbnbListing] = []
    
    public func fetchListings() {
        service.getListings { [weak self] result in
            switch result {
            case .success(let models):
                self?.listings = models
            case .failure:
                break
            }
        }
    }
}
