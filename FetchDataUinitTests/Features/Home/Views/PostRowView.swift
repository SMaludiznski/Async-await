//
//  PostRowView.swift
//  FetchDataUinitTests
//
//  Created by Sebastian Maludziński on 05/10/2021.
//

import SwiftUI

struct PostRowView: View {
    
    let post: Post
    
    var body: some View {
        HStack (spacing: 10) {
            PostImageView(url: post.thumbnailUrl)
            
            VStack (alignment: .leading, spacing: 2) {
                Text(post.title)
                Text(post.url)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .italic()
            }
            Spacer()
        }
    }
}

struct PostRowView_Previews: PreviewProvider {
    static var previews: some View {
        PostRowView(post: Post.new)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
