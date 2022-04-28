//
//  MovieViewModel.swift
//  MovieApp
//
//  Created by Ravi Ranjan on 28/04/22.
//

import Foundation
import CoreData

//Craete a model for all the data of each Movie
struct MovieViewModel {
    
    let movie: Movie
    var id: NSManagedObjectID  {
        return movie.objectID
    }
    var title: String {
        return movie.title ?? ""
    }
    var director: String {
        return movie.director ?? ""
    }
    var releaseDate: Date {
        return movie.releaseDate ?? Date()
    }
    var rating: Int? {
        return Int(movie.rating)
    }
}
