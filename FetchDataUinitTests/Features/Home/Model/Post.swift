//
//  Post.swift
//  FetchDataUinitTests
//
//  Created by Sebastian Maludziński on 05/10/2021.
//

import Foundation

struct Post: Identifiable, Codable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}

extension Post {
    static let new = Post(albumId: 1,
                          id: 1,
                          title: "reprehenderit est deserunt velit ipsam",
                          url: "https://via.placeholder.com/600/771796",
                          thumbnailUrl: "https://via.placeholder.com/150/771796")
}
