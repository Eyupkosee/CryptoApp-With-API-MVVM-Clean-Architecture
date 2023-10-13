//
//  NewsView.swift
//  SwiftUICoins
//
//  Created by eyüp köse on 4.10.2023.
//

import SwiftUI

struct NewsView: View {
    
    @StateObject var viewModel = NewsViewViewModel()
   
    var body: some View {
        NavigationView{
            ScrollView{
                
                VStack{
                    
                    if viewModel.articles?.count ?? 0 > 0 {
                        ForEach(viewModel.articles! , id:\.url) { newsItem in
                            NavigationLink(destination: NewsDetail(news: newsItem)) {
                                NewsRowView(news: newsItem)
                            }
                        }
                    }
                    else{
                        Text ("")
                    }
                    
                }
                 
            }
            .navigationTitle("News")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(){
                viewModel.fetchingData()
            }
        }
        .foregroundColor(.black)
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
