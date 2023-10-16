//
//  APIService.swift
//  airbnb
//
//  Created by teona nemsadze on 12.10.23.
//

import Foundation

final class APIService {
    init() {}
    struct Constants {
        static let apiUrl = URL(string: "https://public.opendatasoft.com/api/explore/v2.1/catalog/datasets/airbnb-listings/records?limit=100&lang=en&refine=city%3A%22New%20York%22&refine=room_type%3A%22Entire%20home%2Fapt%22")
}
    public func getListings(completion: @escaping (Result<[AirbnbListing], Error>) -> Void) {
        guard let url = Constants.apiUrl else {
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                if let error = error {
                completion(.failure(error))
                } 
                return
            }
            do {
                let response = try JSONDecoder().decode(AirbnbListingsResponse.self, from: data)
                completion(.success(response.results))
            } catch {
                completion(.failure(error))
           }
        } 
        task.resume()
    }
}




