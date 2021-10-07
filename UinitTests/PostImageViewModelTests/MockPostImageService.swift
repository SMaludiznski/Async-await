//
//  MockPostImageService.swift
//  UinitTests
//
//  Created by Sebastian Maludziński on 06/10/2021.
//

import Foundation
import SwiftUI

@testable import FetchDataUinitTests

final class MockPostImageService: PostImageServiceDelegate {
    
    var error = FetchDataErrors.wrongURL
    var imageName = "person"
    
    func fetchImage(url: String) async throws -> UIImage {
        if let returnedImage = UIImage(systemName: imageName) {
            return returnedImage
        } else {
            throw error
        }
    }
}
