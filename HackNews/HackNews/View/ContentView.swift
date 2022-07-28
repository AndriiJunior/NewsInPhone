//
//  ContentView.swift
//  HackNews
//
//  Created by AndyBrila on 21.07.2022.
//

import SwiftUI
import Foundation

struct ContentView: View {
 @ObservedObject var networkMeneger = NetworkManager()
    var body: some View {
        NavigationView{
                    List(networkMeneger.posts){ post in
                        NavigationLink(destination: DetailView(url: post.url)) {
                            HStack {
                                                      Text(String(post.points))
                                                      Text(post.title)
                                                  }
                        }
                      
                    }
                    .navigationTitle("Hack News")
                }
                .navigationViewStyle(StackNavigationViewStyle())
                .onAppear {
                    networkMeneger.fetchData()
                }
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
