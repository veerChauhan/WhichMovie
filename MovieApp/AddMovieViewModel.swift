//
//  AddMovieViewModel.swift
//  MovieApp
//
//  Created by Ravi Ranjan on 28/04/22.
//

import Foundation
import SwiftUI

//Craeting Add moview view model and specifically addding ObserverObject so that can publish from here as well
class AddmoviewViewModel: ObservableObject {
    
    var title: String
    var director: String
    var rating: Double
    var releaseDate: Date
    init(_title: String, _director: String, _rating: Double, _releaseData: Date){
        self.title = _title
        self.director = _director
        self.rating = _rating
        self.releaseDate = _releaseData
    }
    
    func save() {
        let manager = CoreDataManager.shared
        let movie = Movie(context: manager.persitanceContaner.viewContext)
        movie.title = title
        movie.director = director
        movie.rating = rating
        movie.releaseDate = releaseDate
    }
}
