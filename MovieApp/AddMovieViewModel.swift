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
    
    var title: String = ""
    var director: String = ""
    @Published var rating: Int? = nil
    var releaseDate: Date = Date()
   
    
    func save() {
        let manager = CoreDataManager.shared
        let movie = Movie(context: manager.persitanceContaner.viewContext)
        movie.title = title
        movie.director = director
        movie.rating = Double(rating ?? 0)
        movie.releaseDate = releaseDate
        manager.save()
    }
}
