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
    
    func save(){
        do {
            try persitanceContaner.viewContext.save()
        } catch {
            print("failed to save the movie \(error)")
        }
    }
}
