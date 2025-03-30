//
//  Movie_TrackerApp.swift
//  Movie Tracker
//
//  Created by Kajal on 23/12/24.
//

import SwiftUI

@main
struct Movie_TrackerApp: App {
    var body: some Scene {
        WindowGroup {
            MovieDetail(movie: Movie(), newMovie: false)
//            MovieDetail(movie: Movie(), movieStorage: MovieStorage(), newMovie: false)
        }
    }
}
