//
//  ReviewListScreen.swift
//  MovieApp
//
//  Created by Ravi Ranjan on 29/04/22.
//

import SwiftUI

struct ReviewListScreen: View {
    let movie: MovieViewModel
    @State private var isPresented: Bool = false
    @StateObject private var reviewListVM = ReviewListViewModel()
    var body: some View {
        VStack {
            
            List(reviewListVM.reviews, id:\.reviewID) { review in
                HStack {
                    VStack(alignment: .leading) {
                        Text(review.title)
                        Spacer()
                        Text(review.text).font(.caption)
                    }
                    Spacer()
                }
            }
        }.navigationTitle(movie.title)
            .navigationBarItems(trailing: Button("Add new Review") {
                
                isPresented = true
            }).sheet(isPresented: $isPresented) {
                
            } content: {
                AddReviewScreen(movie: movie)
            }.onAppear {
                reviewListVM.getReviewByMovie(vm: movie)
            }

    }
}

struct ReviewListScreen_Previews: PreviewProvider {
    static var previews: some View {
        let movie = MovieViewModel(movie: Movie(context: CoreDataManager.shared.persitanceContaner.viewContext))
        ReviewListScreen(movie: movie).embedInNavigationView()
    }
}
