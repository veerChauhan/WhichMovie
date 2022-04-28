//
//  AddMovieScreen.swift
//  MovieApp
//
//  Created by Mohammad Azam on 2/24/21.
//

import SwiftUI

struct AddMovieScreen: View {
    
    @StateObject private var addMoviewViewModel = AddmoviewViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Form {
            TextField("Enter name", text: $addMoviewViewModel.title)
            TextField("Enter director", text: $addMoviewViewModel.director)
            HStack {
                Text("Rating")
                Spacer()
                RatingView(rating: $addMoviewViewModel.rating)
            }
            DatePicker("Release Date", selection: $addMoviewViewModel.releaseDate)
            
            HStack {
                Spacer()
                Button("Save") {
                    addMoviewViewModel.save()
                    presentationMode.wrappedValue.dismiss()
                }
                Spacer()
            }
            
        }
        .navigationTitle("Add Movie")
        .embedInNavigationView()
    }
}

struct AddMovieScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddMovieScreen()
    }
}
