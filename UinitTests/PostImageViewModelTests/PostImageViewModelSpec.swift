//
//  PostImageViewModelTests.swift
//  UinitTests
//
//  Created by Sebastian Maludziński on 06/10/2021.
//

import XCTest
@testable import FetchDataUinitTests

class PostImageViewModelSpec: XCTestCase {

    var vm: PostImageViewModel!
    var mockService: MockPostImageService!
    
    @MainActor override func setUp() {
        mockService = MockPostImageService()
        vm = .init(service: mockService, url: "")
    }

    @MainActor func test_getting_good_image_from_the_internet() async {
        var returnedImage: UIImage? = nil
        
        await vm.getPostImageFromNetwork()
        
        if case let .succes(image) = vm.state {
            returnedImage = image
        }
        
        XCTAssertNotNil(returnedImage)
    }
    
    @MainActor func test_is_get_post_from_internet_throws_error() async {
        mockService.imageName = ""
        var returnedError = false
        
        await vm.getPostImageFromNetwork()
        
        if case .failed = vm.state {
            returnedError = true
        }
        
        XCTAssert(returnedError)
    }
    
}
