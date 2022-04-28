//
//  Review+Extension.swift
//  MovieApp
//
//  Created by Ravi Ranjan on 29/04/22.
//

import Foundation
import CoreData
extension Review {
    static func getReviewByMovieId(movieId: NSManagedObjectID) -> [Review] {
        
        let request : NSFetchRequest<Review> = Review.fetchRequest()
        request.predicate = NSPredicate(format: "movie = %a", argumentArray: movieId)
        do {
            return CoreDataManager.shared.persitanceContaner.viewContext.fetch(request)
        } catch {
            print("Error \(error.localizedDescription)")
        }
    }
}
