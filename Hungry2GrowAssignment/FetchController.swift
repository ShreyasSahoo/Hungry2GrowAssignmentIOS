//
//  FetchController.swift
//  Hungry2GrowAssignment
//
//  Created by Shreyas Sahoo on 18/04/24.
//
import Foundation

struct FetchController {
    enum NetworkError : Error {
        case badURL , badResponse
    }
    private let baseURL = URL(string: "https://jsonplaceholder.typicode.com")!
    
    func fetchPosts () async throws -> [Post]{
        let postURL = baseURL.appending(path: "posts")
        let postComponents = URLComponents(url: postURL, resolvingAgainstBaseURL: true)

        guard let fetchURL = postComponents?.url else {
            throw NetworkError.badURL
        }
        
        let (data,response) = try await URLSession.shared.data(from:fetchURL)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.badResponse
        }
        let posts = try JSONDecoder().decode([Post].self, from:data)
        
        return posts
    }
    
    func fetchUsers () async throws -> [User]{
        let userURL = baseURL.appending(path: "users")
        let userComponents = URLComponents(url: userURL, resolvingAgainstBaseURL: true)

        guard let fetchURL = userComponents?.url else {
            throw NetworkError.badURL
        }
        
        let (data,response) = try await URLSession.shared.data(from:fetchURL)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.badResponse
        }
        let users = try JSONDecoder().decode([User].self, from:data)
        
        return users
    }
  
}
