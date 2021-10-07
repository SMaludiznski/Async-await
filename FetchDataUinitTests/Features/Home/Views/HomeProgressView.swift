//
//  HomeProgressView.swift
//  FetchDataUinitTests
//
//  Created by Sebastian Maludziński on 06/10/2021.
//

import SwiftUI

struct HomeProgressView: View {
    var body: some View {
        VStack (alignment: .center, spacing: 20) {
            ProgressView()
            Text("search for posts...")
                .font(.title2)
                .italic()
        }
        .frame(maxWidth:.infinity, minHeight: UIScreen.main.bounds.size.height)
    }
}

struct HomeProgressView_Previews: PreviewProvider {
    static var previews: some View {
        HomeProgressView()
    }
}
