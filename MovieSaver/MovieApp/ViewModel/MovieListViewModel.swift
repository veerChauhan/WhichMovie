//
//  MovieListViewModel.swift
//  MovieApp
//
//  Created by Ravi Ranjan on 28/04/22.
//

import Foundation
class MovieListViewModel : ObservableObject {
    
    
    //Get all the movies for Movie List
   @Published  var movies = [MovieViewModel]()
    
    //delete movie from Movie list by getting movie with id
    func deleteMovie(_ movie: MovieViewModel){
        let movie = CoreDataManager.shared.getMovieByID(with: movie.id)
        if let movie = movie {
            CoreDataManager.shared.deleteMoview(movie)
        }
    }
    func getAllMoview(){
        let movies = CoreDataManager.shared.getAllMovies()
        
        DispatchQueue.main.async {
            self.movies = movies.map(MovieViewModel.init)
        }
    }
}
