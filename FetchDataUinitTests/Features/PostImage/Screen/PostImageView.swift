//
//  PostImageView.swift
//  FetchDataUinitTests
//
//  Created by Sebastian Maludziński on 05/10/2021.
//

import SwiftUI

struct PostImageView: View {
    
    @StateObject private var vm: PostImageViewModel
    
    init(url: String) {
        _vm = StateObject(wrappedValue: PostImageViewModel(url: url))
    }
    
    var body: some View {
        VStack {
            switch vm.state {
            case .succes(let image):
                ImageView(image: image)
            case .loading:
                ImageProgressView()
            default:
                BadImageView()
            }
        }
        .task {
            await vm.getPostImageFromCache()
        }
    }
}

struct PostImageView_Previews: PreviewProvider {
    static var previews: some View {
        PostImageView(url: Post.new.thumbnailUrl)
    }
}
