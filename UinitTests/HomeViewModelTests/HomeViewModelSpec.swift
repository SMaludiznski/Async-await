//
//  HomeViewModelSpec.swift
//  UinitTests
//
//  Created by Sebastian Maludziński on 05/10/2021.
//

import XCTest
@testable import FetchDataUinitTests

class HomeViewModelSpec: XCTestCase {

    var vm: HomeViewModel!
    var mockPostsSerice: MockPostsService!
    
    @MainActor override func setUp() {
        super.setUp()
        mockPostsSerice = MockPostsService()
        vm = .init(service: mockPostsSerice)
    }
    
    @MainActor func test_posts_are_not_empty() async {
        var returnedData: Int = 0
        mockPostsSerice.returnResult = [Post.new]
        
        await vm.getPosts()
        
        if case let .success(data) = vm.state {
            if data.count != 0 {
                returnedData = data.count
            } else {
                returnedData = 1
            }
        }
        
        XCTAssertGreaterThan(returnedData, 0)
    }
    
    @MainActor func test_posts_are_empty() async {
        var returnedData: [Post]? = nil
        mockPostsSerice.returnResult = []
        
        await vm.getPosts()
        
        if case let .success(data) = vm.state {
            returnedData = data
        }
        
        XCTAssertEqual(returnedData?.count, 0)
    }
    
    @MainActor func test_posts_wrong_url() async {
        var returnedError: FetchDataErrors? = nil
        
        await vm.getPosts()
        
        if case let .failed(error) = vm.state {
            returnedError = error as? FetchDataErrors
        }
        
        XCTAssertEqual(returnedError, FetchDataErrors.wrongURL)
    }
    
    @MainActor func test_posts_decoding_error() async {
        var returnedError: FetchDataErrors? = nil
        
        mockPostsSerice.error = .decodingError
        await vm.getPosts()
        
        if case let .failed(error) = vm.state {
            returnedError = error as? FetchDataErrors
        }
        
        XCTAssertEqual(returnedError, FetchDataErrors.decodingError)
    }
    
    @MainActor func test_posts_wrong_server_response() async {
        var returnedError: FetchDataErrors? = nil
        
        mockPostsSerice.error = .wrongServerResponse
        await vm.getPosts()
        
        if case let .failed(error) = vm.state {
            returnedError = error as? FetchDataErrors
        }
        
        XCTAssertEqual(returnedError, FetchDataErrors.wrongServerResponse)
    }
}
