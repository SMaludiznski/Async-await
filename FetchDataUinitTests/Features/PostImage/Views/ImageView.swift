//
//  ImageView.swift
//  FetchDataUinitTests
//
//  Created by Sebastian Maludziński on 06/10/2021.
//

import SwiftUI

struct ImageView: View {
    
    let image: UIImage
    
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .scaledToFit()
            .frame(width: 60, height: 60)
            .clipShape(Circle())
            .shadow(radius: 5)
            .padding(.vertical)
            .padding(.trailing, 10)
    }
}
