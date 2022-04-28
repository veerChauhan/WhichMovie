//
//  AddReviewScreen.swift
//  MovieApp
//
//  Created by Ravi Ranjan on 29/04/22.
//

import SwiftUI

struct AddReviewScreen: View {
    @StateObject private var addReviewVm = AddReviewViewModel()
    @Environment(\.presentationMode) var presentationMode

    let movie:MovieViewModel
    var body: some View {
        Form {
            TextField("Enter the title", text: $addReviewVm.text)
            TextEditor(text: $addReviewVm.text)
            HStack {
                Spacer()
                Button("Save") {
                    addReviewVm.addReviewForMovie(vm: movie)
                    presentationMode.wrappedValue.dismiss()
                }
                Spacer()
            }
        }.navigationTitle("Add Review")
            .embedInNavigationView()
    }
}

struct AddReviewScreen_Previews: PreviewProvider {
    static var previews: some View {
        let movie = MovieViewModel(movie: Movie(context: CoreDataManager.shared.persitanceContaner.viewContext))
        AddReviewScreen(movie: movie)
    }
}
