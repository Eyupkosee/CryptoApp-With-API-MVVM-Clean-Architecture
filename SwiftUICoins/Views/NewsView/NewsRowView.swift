//
//  NewsRowView.swift
//  SwiftUICoins
//
//  Created by eyüp köse on 4.10.2023.
//

import SwiftUI
import Kingfisher

struct NewsRowView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    let news: Article
    var body: some View {
        VStack{
            HStack{
                KFImage(URL(string: news.urlToImage ?? "https://www.indyturk.com/sites/default/files/styles/1368x911/public/article/main_image/2021/04/27/647331-1912590235.png?itok=_neh8Q2V"))
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width * 0.3, height: UIScreen.main.bounds.height * 0.1)
                
                VStack(alignment: .leading){
                    Text(news.title ?? "News Title")
                        .font(.headline)
                        .bold()
                        .multilineTextAlignment(.leading)
                        .foregroundColor(isDarkMode ? .white : .black )
                    
                    
                    
                    HStack{
                        Text("")
                        Spacer()
                        Text(news.author ?? "CNBC News")
                            .foregroundColor(.gray)
                            .font(.caption)
                            .italic()
                    }
                    .padding(.top,2)
                    
                    
                }
                .padding(.leading,12)
                
                    
            }
            Divider()
        }
        .padding(.horizontal)
        .padding(.top,25)
       
    }
}

/*
struct NewsRowView_Previews: PreviewProvider {
    static var previews: some View {
        NewsRowView()
    }
}

*/
