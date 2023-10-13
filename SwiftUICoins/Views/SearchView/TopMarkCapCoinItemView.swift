//
//  TopMarkCapCoinItemView.swift
//  SwiftUICoins
//
//  Created by eyüp köse on 10.10.2023.
//

import SwiftUI
import Kingfisher


struct TopMarkCapCoinItemView: View {
    let coin: Coin
    var body: some View {
        VStack(alignment: .leading){
            //IMAGE
            KFImage(URL(string: coin.image))
                .resizable()
                .frame(width: 32,height: 32)
                .foregroundColor(.orange)
                .padding(.bottom,8)
            
            //Coin info
            HStack(spacing: 4){
                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .bold()
                Text(coin.currentPrice.toCurrency())
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            //Percent Change
            Text(coin.priceChangePercentage24H.toPercentString())
                .font(.title2)
                .foregroundColor(coin.priceChangePercentage24H > 0 ? .green : .red)
                .padding(.top,1)
            
        }
        .frame(width: 140,height: 140)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(.systemGray4), lineWidth: 2)
        )
    }
}


/*
struct TopMarkCapCoinItemView_Previews: PreviewProvider {
    static var previews: some View {
        TopMarkCapCoinItemView()
    }
}
*/
