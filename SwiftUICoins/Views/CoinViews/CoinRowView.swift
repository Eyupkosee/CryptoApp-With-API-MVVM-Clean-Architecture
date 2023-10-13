//
//  CoinRowView.swift
//  SwiftUICoins
//
//  Created by eyüp köse on 3.10.2023.
//

import SwiftUI
import Kingfisher

struct CoinRowView: View {
    let coin: Coin
    
    var body: some View {
        HStack{
            //Marketcap rank
            Text("\(coin.marketCapRank )")
                .font(.caption)
                .foregroundColor(.gray)
            
            //image
            KFImage(URL(string: coin.image))
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .foregroundColor(.orange)
            
            //coin name info
            VStack(alignment: .leading, spacing: 4){
                Text(coin.name)
                    .padding(.leading, 4)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text(coin.symbol.uppercased())
                    .padding(.leading, 4)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding(.leading, 2)
            
            Spacer()
            
            
            //coin price info
            VStack(alignment: .trailing, spacing: 4){
                Text(coin.currentPrice.toCurrency())
                    .padding(.trailing, 4)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text(coin.priceChangePercentage24H.toPercentString())
                    .padding(.trailing, 4)
                    .font(.caption)
                    .foregroundColor(coin.priceChangePercentage24H > 0 ? .green : .red)
            }
            .padding(.trailing, 2)
            
        }
        .padding(.vertical,4)
        .padding(.horizontal)
    }
}

/*
struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        CoinRowView()
    }
}
*/
