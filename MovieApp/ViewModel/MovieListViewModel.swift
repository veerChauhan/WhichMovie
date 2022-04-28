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
    
    func getAllMoview(){
        let movies = CoreDataManager.shared.getAllMovies()
        
        DispatchQueue.main.async {
            self.movies = movies.map(MovieViewModel.init)
        }
    }
}
