//
//  title: "Title".swift
//  Movie Tracker
//
//  Created by Kajal on 23/12/24.
//

import SwiftUI

struct MovieDetail: View {
    /*
    var body: some View {
        Text("Hello, world!")
            .padding()
            .background(Color.blue)
        Text("Hello, world!")
            .background(Color.blue)
            .padding()
            .background(Color.green)
        Image("code").resizable().aspectRatio(contentMode: .fit)
        
        
        // By default everything has the priority 0
        HStack {
            Text("Hello Kajal, it's nice to meet you").lineLimit(1).layoutPriority(1)
            Image(systemName: "lightbulb")
            Text("Goodbye Kajal, let's meet tomorrow morning").lineLimit(1)
        }
        
        VStack(alignment: .leading) {
            Text("Hello Kajal, it's nice to meet you").lineLimit(1).layoutPriority(1)
            Image(systemName: "lightbulb")
            Text("Goodbye Kajal, let's meet tomorrow morning").lineLimit(1)
        }
        
        ZStack {
            Image("code").resizable().aspectRatio(contentMode: .fit)
            Button (action: hello) {
                Image(systemName: "play.fill").resizable().foregroundColor(.red).aspectRatio(contentMode: .fit).frame(width: 100, height: 100)
            }
        }
        
        Button (action: {}) {
            HStack {
                Text("Tap me")
                Image(systemName: "gamecontroller")
            }.padding().background(Color.blue).cornerRadius(10.0).foregroundColor(Color.white)
        }
    }
    
    func hello() {
        print("Hello")
    }
    */
    
    @State var movie: Movie
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var movieStorage: MovieStorage
//    @ObservedObject var movieStorage: MovieStorage
    var newMovie: Bool
    
    var body: some View {
        List {
            Section {
                SectionTitle(title: "Title")
                TextField("Movie Title", text: $movie.title)
            }
            Section {
                SectionTitle(title: "Rating")
                HStack {
                    Spacer()
                    Text(String(repeating: "★", count: Int(movie.rating)))
                        .foregroundColor(.yellow)
                        .font(.title)
                        .accessibilityLabel("\(Int(movie.rating)) star rating")
                    Spacer()
                }
                Slider(value: $movie.rating, in: 1...5, step: 1)
                    .accessibility(value: Text("\(Int(movie.rating))"))
            }
            Section {
                SectionTitle(title: "Seen")
                Toggle(isOn: $movie.seen) {
                    if movie.title == "" {
                        Text("I have seen this movie")
                    } else {
                        Text("I have seen \(movie.title)")
                    }
                }
            }
            Section {
                Button(action: {
                    if newMovie {
                        movieStorage.movies.append(movie)
                    } else {
                        for x in 0..<movieStorage.movies.count {
                            if movieStorage.movies[x].id == movie.id {
                                movieStorage.movies[x] = movie
                            }
                        }
                    }
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Spacer()
                        Text("Save")
                        Spacer()
                    }
                }.disabled(movie.title.isEmpty)
            }
        }.listStyle(GroupedListStyle())
    }
}

#Preview {
    MovieDetail(movie: Movie(), newMovie: true).environmentObject(MovieStorage())
//    MovieDetail(movie: Movie(), newMovie: true)
//    MovieDetail(movie: Movie(), movieStorage: MovieStorage(), newMovie: true)
}

struct SectionTitle: View {
    var title: String
    
    var body: some View {
        Text(title).font(.caption).foregroundColor(.green)
    }
}
