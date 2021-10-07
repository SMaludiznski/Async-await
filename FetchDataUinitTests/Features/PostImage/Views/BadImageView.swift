//
//  BadImageView.swift
//  FetchDataUinitTests
//
//  Created by Sebastian Maludziński on 06/10/2021.
//

import SwiftUI

struct BadImageView: View {
    
    var body: some View {
        Image(systemName: "xmark")
            .font(.largeTitle)
            .frame(width: 60, height: 60)
            .background(Color.white)
            .clipShape(Circle())
            .shadow(radius: 5)
            .padding(.vertical)
            .padding(.trailing, 10)
    }
}

struct BadImageView_Previews: PreviewProvider {
    static var previews: some View {
        BadImageView()
    }
}
