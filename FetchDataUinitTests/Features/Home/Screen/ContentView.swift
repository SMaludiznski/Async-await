//
//  ContentView.swift
//  FetchDataUinitTests
//
//  Created by Sebastian Maludziński on 05/10/2021.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var vm: HomeViewModel = HomeViewModel()
    
    var body: some View {
        VStack {
            List {
                switch vm.state {
                case .loading:
                    HomeProgressView()
                case .failed(let error):
                    Text(error.localizedDescription)
                case .success(let posts):
                    ForEach(posts) { post in
                        PostRowView(post: post)
                    }
                default:
                    EmptyView()
                }
            }
        }
        .listStyle(PlainListStyle())
        .task {
            await vm.getPosts()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
