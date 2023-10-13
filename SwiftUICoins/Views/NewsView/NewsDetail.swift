//
//  NewsDetail.swift
//  SwiftUICoins
//
//  Created by eyüp köse on 4.10.2023.
//

import SwiftUI
import Kingfisher

struct NewsDetail: View {
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    let news: Article
    var body: some View {
        ScrollView(showsIndicators: false){
            // image
            VStack{
                KFImage(URL(string: news.urlToImage ?? "https://www.indyturk.com/sites/default/files/styles/1368x911/public/article/main_image/2021/04/27/647331-1912590235.png?itok=_neh8Q2V"))
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.2)
            }
            //News Title
            VStack{
                Text(news.title ?? "News Title")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .padding(.top,20)
                    .foregroundColor(isDarkMode ? .white : .black )
            }
            
            VStack{
                Text("Kripto para dünyasında heyecan verici gelişmeler yaşanıyor. Son haberlere göre, gizlilik odaklı bir yeni kripto para birimi olan HoloGuard piyasaya sürüldü ve büyük bir ilgi gördü. HoloGuard, benzersiz bir teknolojiye dayanıyor ve kullanıcıların kişisel bilgilerini koruma konusundaki endişelerini gidermeyi amaçlıyor. Haberlere göre, HoloGuard'ın arkasındaki ekip, güvenliğe odaklanarak geleneksel merkezi olmayan finansın sınırlarını zorluyor. Yatırımcılar, HoloGuard'ı kullanarak işlemlerini izlenebilirlikten uzak bir şekilde gerçekleştirebilecekler. Bu da kişisel gizliliğin daha fazla korunmasını sağlayacak. Ayrıca, merkezi olmayan finansın önemli bir parçası olan DeFi (Merkezi Olmayan Finans) projelerinin de hızla büyüdüğü belirtiliyor. DeFi, geleneksel finans kurumlarını devre dışı bırakarak daha fazla finansal özgürlük sunmayı amaçlıyor.")
                    .font(.body)
                    .padding()
                    .foregroundColor(isDarkMode ? .white : .black )

                HStack{
                    Text("")
                    Spacer()
                    Text(news.author ?? "CNBC News")
                        .italic()
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
        
            Spacer()
        }
        .padding()
    }
}



/*
struct NewsDetail_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetail()
    }
}
*/
