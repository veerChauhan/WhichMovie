//
//  ReviewListScreen.swift
//  MovieApp
//
//  Created by Ravi Ranjan on 29/04/22.
//

import SwiftUI

struct ReviewListScreen: View {
    
    @State private var isPresented: Bool = false
    var body: some View {
        VStack {
            
            List(0...20, id:\.self) { index in
                HStack {
                    VStack(alignment: .leading) {
                        Text("Review")
                    }
                    Spacer()
                    Text("Review published Dare")
                }
            }
        }.navigationTitle("Movie Title")
            .navigationBarItems(trailing: Button("Add new Review") {
                isPresented = true
            }).embedInNavigationView()
    }
}

struct ReviewListScreen_Previews: PreviewProvider {
    static var previews: some View {
        ReviewListScreen()
    }
}
