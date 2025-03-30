//
//  Movie.swift
//  Movie Tracker
//
//  Created by Kajal on 23/12/24.
//

import Foundation

struct Movie: Identifiable {
    var id = UUID()
    var title = ""
    var rating = 3.0
    var seen = false
}

class MovieStorage: ObservableObject {
    // Published to inform theSwiftUI that there is some changes happen, and you have to update the UI (Like addition or deletion something)
    @Published var movies = [Movie]()
}
