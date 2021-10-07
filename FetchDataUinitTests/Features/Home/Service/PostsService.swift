//
//  PostsService.swift
//  FetchDataUinitTests
//
//  Created by Sebastian Maludziński on 05/10/2021.
//

import Foundation

protocol PostServiceDelegate {
    func fetchPosts() async throws -> [Post]
}

final class PostService: PostServiceDelegate {
    
    func fetchPosts() async throws -> [Post] {
        
        guard let url = URL(string: Constants.apiKey) else { throw FetchDataErrors.wrongURL }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
                  throw FetchDataErrors.wrongServerResponse
              }
        
        do {
            let posts = try JSONDecoder().decode([Post].self, from: data)
            return posts
        } catch {
            throw FetchDataErrors.decodingError
        }
        
    }
    
}
