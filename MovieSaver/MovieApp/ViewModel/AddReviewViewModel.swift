//
//  AddReviewViewModel.swift
//  MovieApp
//
//  Created by Ravi Ranjan on 29/04/22.
//

import Foundation

class AddReviewViewModel:ObservableObject {
    
    
    var title: String = ""
    var text: String = ""
    
    func addReviewForMovie(vm: MovieViewModel){
        let manager = CoreDataManager.shared
        let movie = CoreDataManager.shared.getMovieByID(with: vm.id)
        let review = Review(context:manager.persitanceContaner.viewContext)
        review.title = title
        review.text = text
        review.movie = movie
        review.publishedAt = Date()
        manager.save()
    }
}
