//
//  PostImageService.swift
//  FetchDataUinitTests
//
//  Created by Sebastian Maludziński on 05/10/2021.
//

import Foundation
import UIKit

protocol PostImageServiceDelegate {
    func fetchImage(url: String) async throws -> UIImage
}

final class PostImageService: PostImageServiceDelegate {
    
    func fetchImage(url: String) async throws -> UIImage {
        
        guard let url = URL(string: url) else { throw FetchDataErrors.wrongURL }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
                  throw FetchDataErrors.wrongServerResponse
              }
        
        guard let image = UIImage(data: data) else {
            throw FetchDataErrors.decodingError
        }
        return image
    }
}
