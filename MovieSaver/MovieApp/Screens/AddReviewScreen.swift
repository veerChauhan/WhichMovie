//
//  AddReviewScreen.swift
//  MovieApp
//
//  Created by Ravi Ranjan on 29/04/22.
//

import SwiftUI

struct AddReviewScreen: View {
    @State private var title: String = ""
    @State private var text: String = ""

    var body: some View {
        Form {
            TextField("Enter the title", text: $title)
            TextEditor(text: $text)
            HStack {
                Spacer()
                Button("Save") {
                    
                }
                Spacer()
            }
        }.navigationTitle("Add Review")
            .embedInNavigationView()
    }
}

struct AddReviewScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddReviewScreen()
    }
}
