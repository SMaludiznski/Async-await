//
//  MockPostsService.swift
//  UinitTests
//
//  Created by Sebastian Maludziński on 05/10/2021.
//

import Foundation
@testable import FetchDataUinitTests

final class MockPostsService: PostServiceDelegate {
    
    var returnResult: [Post]? = nil
    var error: FetchDataErrors = .wrongURL
    
    func fetchPosts() async throws -> [Post] {
        
        if returnResult != nil {
            return returnResult!
        } else {
            throw error
        }
    }
}
