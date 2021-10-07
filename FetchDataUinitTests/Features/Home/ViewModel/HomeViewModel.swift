//
//  HomeViewModel.swift
//  FetchDataUinitTests
//
//  Created by Sebastian Maludziński on 05/10/2021.
//

import Foundation
import SwiftUI


enum FetchDataState: Equatable {
    static func == (lhs: FetchDataState, rhs: FetchDataState) -> Bool {
        return true
    }
    case na
    case failed(error: Error)
    case success(data: [Post])
    case loading
}

@MainActor
protocol HomeViewModelDelegate {
    var state: FetchDataState { get }
    var service: PostServiceDelegate { get }
    func getPosts() async throws
    init(service: PostServiceDelegate)
}


final class HomeViewModel: ObservableObject, HomeViewModelDelegate {

    @Published private(set) var state: FetchDataState
    var service: PostServiceDelegate
    
    init(service: PostServiceDelegate = PostService()) {
        self.state = .na
        self.service = service
    }
    
    func getPosts() async {
        self.state = .loading
        
        do {
            let posts = try await service.fetchPosts()
            self.state = .success(data: posts)
        } catch (let error) {
            print(error)
            self.state = .failed(error: error)
        }
    }
}
