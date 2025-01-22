//
//  JokesApi.swift
//  SwiftUIListTest
//
//  Created by Masud  Parvez on 21/1/25.
//

import SwiftUI


struct Jokes : Codable {
    let setup : String
    let delivery : String
}

struct JokesApi: View {
    
    
//    func fetchJokes() async throws -> Jokes{
//        let url = URL(string: "https://v2.jokeapi.dev/joke/Programming?type=twopart")!
//        let request = URLRequest(url: url)
//        let (data, _) = try await URLSession.shared.data(for: request)
//        let jokes = try JSONDecoder().decode(Jokes.self, from: data)
//        return jokes
//    }
//
    
    
    func fetchJokes()async throws -> Jokes{
        let url = URL(string: "https://v2.jokeapi.dev/joke/Programming?type=twopart")!
        let request = URLRequest(url: url)
        let (data , _) = try await URLSession.shared.data(for: request)
        let jokes = try JSONDecoder().decode(Jokes.self, from: data)
        return jokes
    }
    
    @State private var joke : Jokes?
    @State private var isLoading : Bool = false
    
    var body: some View {
        VStack{
            if let joke = joke {
                Text("\(joke.setup)")
                    .font(.title)
                Text("\(joke.delivery)")
                    .font(.headline)
            }else {
                Text("Tap to fetch a joke!")
            }
            
            Button{
                Task{
                    isLoading = true
                    do{
                        joke = try await fetchJokes()
                        self.isLoading = false
                    } catch {
                        print("Failed to fetch joke \(error)")
                    }
                }
            } label: {
                if isLoading {
                    ProgressView()
                        .progressViewStyle(.circular)
                        .padding(.horizontal)
                } else {
                    Text("Fetch Joke")
                }
            }
            .disabled(isLoading)
            .buttonStyle(.borderedProminent)
            .padding()
        }
        .multilineTextAlignment(.center)
        .padding(.horizontal)
    }
}

#Preview {
    JokesApi()
}
