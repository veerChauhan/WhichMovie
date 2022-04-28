//
//  MovieListScreen.swift
//  MovieApp
//
//  Created by Mohammad Azam on 2/24/21.
//

import SwiftUI

struct MovieListScreen: View {
    
    //View model for movie list which work is to get data for movies model
    @StateObject private var movieListVM = MovieListViewModel()
    @State private var isPresented: Bool = false
    private func deleteMovie(at IndexSet: IndexSet){
        IndexSet.forEach { index in
            let movie = movieListVM.movies[index]
            // delete the movie
            movieListVM.deleteMovie(movie)
            
            // get all the movie
            movieListVM.getAllMoview()
        }
    }
    var body: some View {
        List {
            ForEach(movieListVM.movies, id:\.id) { movie in
                NavigationLink(destination: ReviewListScreen(movie:movie)) {
                    MovieCell(movie: movie)
                }
            }.onDelete(perform: deleteMovie)
            
        }.listStyle(PlainListStyle())
        .navigationTitle("Movies")
        .navigationBarItems(trailing: Button("Add Movie") {
            isPresented = true 
        })
        .sheet(isPresented: $isPresented, onDismiss: {
            //Every time screen get presented when we dissmiss from add movie controller on dismiss will get call so we need to get al movies as we have added a new movie in DB
            movieListVM.getAllMoview()
        },  content: {
            AddMovieScreen()
        })
        .embedInNavigationView()
        
        .onAppear(perform: {
            movieListVM.getAllMoview()
        })
    }
}

struct MovieListScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MovieListScreen()
        }
    }
}

struct MovieCell: View {
    
    
    // Passing single movie to the cell and rendring it on UI
    let movie: MovieViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(movie.title)
                    .fontWeight(.bold)
                Text(movie.director)
                    .font(.caption2)
                Text("\(movie.releaseDate)")
                    .font(.caption)
            }
            Spacer()
            RatingView(rating: .constant(movie.rating))
        }
    }
}
