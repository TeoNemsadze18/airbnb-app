//
//  AirbnbListingsView.swift
//  airbnb
//
//  Created by teona nemsadze on 12.10.23.
//

import SwiftUI
 
struct AirbnbListingsView: View {
    @StateObject var viewModel = AirbnbListingsViewViewModel()
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.listings.isEmpty {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                } else {
            List(viewModel.listings) { listing in
                NavigationLink(destination: AirbnbDetailView(model: listing), label: {
                    AirbnbListingCardView(model: listing)
                })
            }
        }
    }
            .navigationTitle("Airbnb")
        }
        .onAppear {
            viewModel.fetchListings()
        }
    }
}
