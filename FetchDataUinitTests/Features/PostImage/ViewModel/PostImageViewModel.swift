//
//  PostImageViewModel.swift
//  FetchDataUinitTests
//
//  Created by Sebastian Maludziński on 05/10/2021.
//

import Foundation
import UIKit

enum ImageFetchState {
    case na
    case succes(image: UIImage)
    case failed
    case loading
}

@MainActor
protocol PostImageViewModelDelegate {
    var service: PostImageServiceDelegate { get }
    var state: ImageFetchState { get }
    var url: String { get }
    func getPostImageFromCache() async
    func getPostImageFromNetwork() async
    init(service: PostImageServiceDelegate, url: String)
}

final class PostImageViewModel: ObservableObject, PostImageViewModelDelegate {
    
    @Published private(set) var state: ImageFetchState = .na
    
    var url: String
    var service: PostImageServiceDelegate
    
    init(service: PostImageServiceDelegate = PostImageService(), url: String) {
        self.service = service
        self.url = url
    }

    func getPostImageFromCache() async {
        self.state = .loading
        if let image = CacheManager.instance.getImageFromCache(name: url) {
            self.state = .succes(image: image)
        } else {
            await getPostImageFromNetwork()
        }
    }
    
    func getPostImageFromNetwork() async {
        do {
            let image = try await service.fetchImage(url: url)
            self.state = .succes(image: image)
            CacheManager.instance.addImageToCache(image: image, name: url)
        } catch (let error) {
            self.state = .failed
            print("Error: \(error.localizedDescription)")
        }
    }
}
