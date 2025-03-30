//
//  MovieList.swift
//  Movie Tracker
//
//  Created by Kajal on 23/12/24.
//

import SwiftUI

struct MovieList: View {
    // Can be accessed anywhere inside this project
    @EnvironmentObject var movieStorage : MovieStorage
//    @ObservedObject var movieStorage = MovieStorage()
//    var movies = [Movie(), Movie(), Movie()]
    
    var body: some View {
        NavigationView {
//            List(movies) { currMovie in
            List(movieStorage.movies) { currMovie in
//                NavigationLink(destination: MovieDetail(movie: currMovie, movieStorage: movieStorage, newMovie: false)) {
                NavigationLink(destination: MovieDetail(movie: currMovie, newMovie: false)) {
                    Text(currMovie.title)
                }
//            }.navigationBarTitle("Movies").navigationBarItems(trailing: NavigationLink(destination: MovieDetail(movie: Movie(), movieStorage: movieStorage, newMovie: true)) {
            }.navigationBarTitle("Movies").navigationBarItems(trailing: NavigationLink(destination: MovieDetail(movie: Movie(), newMovie: true)) {
//                Text("Create")
                Image(systemName: "plus")
            })
        }
    }
}

#Preview {
    MovieList().environmentObject(MovieStorage())
//    MovieList()
}
