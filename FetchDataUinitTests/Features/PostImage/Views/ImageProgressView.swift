//
//  ImageProgressView.swift
//  FetchDataUinitTests
//
//  Created by Sebastian Maludziński on 06/10/2021.
//

import SwiftUI

struct ImageProgressView: View {
    var body: some View {
        ProgressView()
            .frame(width: 60, height: 60)
            .background(Color.white)
            .clipShape(Circle())
            .shadow(radius: 5)
            .padding(.vertical)
            .padding(.trailing, 10)
    }
}

struct ImageProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ImageProgressView()
    }
}
