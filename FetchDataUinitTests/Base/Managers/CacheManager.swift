//
//  CacheManager.swift
//  FetchDataUinitTests
//
//  Created by Sebastian Maludziński on 06/10/2021.
//

import Foundation
import UIKit

final class CacheManager {
    
    static let instance: CacheManager = CacheManager()
    private init() {}
    
    private var imageCache: NSCache<NSString, UIImage> = {
       let cache = NSCache<NSString, UIImage>()
        cache.countLimit = 50
        cache.totalCostLimit = 1024 * 1024 * 100
        return cache
    }()
    
    func addImageToCache(image: UIImage, name: String) {
        imageCache.setObject(image, forKey: name as NSString)
    }
    
    func getImageFromCache(name: String) -> UIImage? {
        if let image = imageCache.object(forKey: name as NSString) {
            return image
        }
        return nil
    }
}
