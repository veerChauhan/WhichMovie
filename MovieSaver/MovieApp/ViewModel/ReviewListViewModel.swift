//
//  ReviewListViewModel.swift
//  MovieApp
//
//  Created by Ravi Ranjan on 29/04/22.
//

import Foundation
import CoreData
class ReviewListViewModel: ObservableObject {
    
    @Published var reviews = [ReviewViewModel]()
    
    func getReviewByMovie(vm: MovieViewModel){
        
        DispatchQueue.main.async {
            self.reviews = Review.getReviewByMovieId(movieId: vm.id).map(ReviewViewModel.init)
        }
    }
}

/*
 Line 17 was
 
      let movie = CoreDataManager.shared.getMovieByID(with: vm.id)
        if let movie = movie {
           self.reviews =  (movie.reviews?.allObjects as! [Review]).map(ReviewViewModel.init)
 }
 */

struct ReviewViewModel {
    let review : Review
     
    var reviewID: NSManagedObjectID {
        return review.objectID
    }
    var title: String {
        return review.title ?? ""
    }
    var text: String {
        return review.text ?? ""
    }
    var publishAt: Date {
        return review.publishedAt ?? Date()
    }
   
}
