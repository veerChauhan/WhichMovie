//
//  CoreDataManager.swift
//  MovieApp
//
//  Created by Mohammad Azam on 2/23/21.
//

import Foundation
import CoreData


//Creting singleton because we don't want multiple instance for each Manager if used in multiple screen
//Reason is to use single instanse of managed object Context
class CoreDataManager {
    
    let persitanceContaner: NSPersistentContainer
    
    static let shared = CoreDataManager()
    
    // You can't create manger instance by initilizing it
    private init() {
        persitanceContaner = NSPersistentContainer.init(name: "MovieCoreDataModel")
        persitanceContaner.loadPersistentStores { (storeDescription, error )in
            if let error = error {
                fatalError("Failed to initilize core data with Data midel \(error.localizedDescription)")
            }
        }
    }

    func getAllMovies() -> [Movie] {
        
        //Strongly typed as we say the request for fetch is of Movie entity 
        let fetchRequest: NSFetchRequest<Movie> = Movie.fetchRequest()
        do {
            return try persitanceContaner.viewContext.fetch(fetchRequest)
        } catch {
            print("There is no movie in Entity")
            return []
        }

    }
    
    // save data to persistance container [CORE DATA ENTITY]
    func save(){
        do {
            try persitanceContaner.viewContext.save()
        } catch {
            print("failed to save the movie \(error)")
        }
    }
    
    func deleteMoview(_ movie: Movie) {
        persitanceContaner.viewContext.delete(movie)
        do{
            try persitanceContaner.viewContext.save()
        } catch {
            persitanceContaner.viewContext.rollback()
            print("Some thing wrong happend Rolling back the error is \(error.localizedDescription)")
        }
    }
    
    func getMovieByID(with id: NSManagedObjectID) -> Movie?{
        do{
            return try persitanceContaner.viewContext.existingObject(with: id) as? Movie
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
