//
//  CoinDetailView.swift
//  SwiftUICoins
//
//  Created by eyüp köse on 3.10.2023.
//

import SwiftUI
import Kingfisher

struct CoinDetailView: View {
    let coin : Coin
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                HStack{
                    Text(coin.name)
                        .fontWeight(.semibold)
                    
                    Text("#\(coin.marketCapRank)")
                        .frame(width: 24,height: 24)
                        .background(.gray .opacity(0.3))
                        .font(.caption)
                        .cornerRadius(4)
                }
                HStack{
                    Text(coin.currentPrice.toCurrency())
                        .font(.subheadline)
                        .bold()
                    Spacer()
                    
                    HStack{
                        if coin.priceChangePercentage24H > 0 {
                            Image(systemName: "arrowtriangle.up.fill")
                                .foregroundColor(.green)
                        } else{
                            Image(systemName: "arrowtriangle.down.fill")
                                .foregroundColor(.red)
                        }
                        
                        Text("\(coin.priceChangePercentage24H.toPercentString())")
                            .foregroundColor(coin.priceChangePercentage24H > 0 ? .green : .red)
                        
                    }
                }
                
                // GRAFİK GELİCEK BURAYA
                VStack{
                    SparkLine(priceData: coin.sparklineIn7D.price, coin: coin)
                        .background(
                            VStack{
                                ColoredDivider(color: .gray, height: 8)
                                Spacer()
                                ZStack {
                                    Divider().background(Color.clear)
                                    Rectangle()
                                        .fill(Color.blue)
                                        .frame(height: 8)
                                }
                                Spacer()
                                Divider()
                                    .background(Color.gray)
                                        .frame(height: 2)
                            }
                        )
                                                
                        
                }
                .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.35)
                
                    
                
                // Overview part
                VStack(alignment: .leading){
                    Text("Overview")
                        .font(.headline)
                        .bold()
                        .padding(.bottom,10)
                    
                    Divider()
                    
                    HStack{
                        
                        // PART 1
                        VStack{
                            Text("Current Price")
                                .font(.caption)
                            
                            Text(coin.currentPrice.toCurrency())
                                .bold()
                            
                            HStack{
                                if coin.priceChangePercentage24H > 0 {
                                    Image(systemName: "arrowtriangle.up.fill")
                                        .foregroundColor(.green)
                                } else{
                                    Image(systemName: "arrowtriangle.down.fill")
                                        .foregroundColor(.red)
                                }
                                
                                Text("\(coin.priceChangePercentage24H.toPercentString())")
                                    .foregroundColor(coin.priceChangePercentage24H > 0 ? .green : .red)
                                
                            }
                        }
                        Spacer()
                        VStack{
                            Text("Market Capitalization")
                                .font(.caption)
                            
                            Text(coin.marketCap?.toCurrency() ?? "$11.27Bn")
                                .bold()
                            
                            HStack{
                                if coin.priceChangePercentage24H > 0 {
                                    Image(systemName: "arrowtriangle.up.fill")
                                        .foregroundColor(.green)
                                } else{
                                    Image(systemName: "arrowtriangle.down.fill")
                                        .foregroundColor(.red)
                                }
                                
                                Text("\(coin.priceChangePercentage24H.toPercentString())")
                                    .foregroundColor(coin.priceChangePercentage24H > 0 ? .green : .red)
                                
                            }
                            
                        }
                    }
                    .padding(.bottom,20)
                    
                    // PART 2
                    HStack{
                        VStack{
                            Text("Rank")
                                .font(.caption)
                            
                            Text("#\(coin.marketCapRank)")
                                .bold()
                            
                            
                        }
                        
                        Spacer()
                        
                        
                        VStack{
                            Text("Volume")
                                .font(.caption)
                            
                            Text(coin.totalVolume?.toCurrency() ?? "11.27Bn")
                                .bold()
                            
                            
                        }
                    }
                    .padding(.bottom,20)
                    
                    // Additional Details Part
                    VStack(alignment: .leading){
                        Text("Additional Details ")
                            .font(.headline)
                            .bold()
                            .padding(.bottom,10)
                        
                        Divider()
                        
                        HStack{
                            
                            // PART 1
                            VStack(alignment: .leading){
                                Text("24h High")
                                    .font(.caption)
                                
                                Text(coin.high24H?.toCurrency() ?? "11")
                                    .bold()
                                
                            }
                            
                            Spacer()
                            
                            VStack{
                                Text("24h Low")
                                    .font(.caption)
                                
                                Text(coin.low24H?.toCurrency() ?? "$11.27Bn")
                                    .bold()
                               
                            }
                        }
                        .padding(.bottom,20)
                        
                        // PART 2
                        HStack{
                            VStack{
                                Text("24h Price Change")
                                    .font(.caption)
                                
                                Text(coin.priceChange24H?.toCurrency() ?? "33")
                                    .bold()
                                
                            }
                            
                            Spacer()
                            
                            
                            VStack{
                                Text("24h Market Cap Change")
                                    .font(.caption)
                                
                                Text(coin.marketCapChange24H.toCurrency())
                                    .bold()
                                
                            }
                        }
                    }
                    
                    Spacer()
                }
                .toolbar(){
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HStack{
                            Text(coin.symbol.uppercased())
                            KFImage(URL(string: coin.image))
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                        }
                    }
                }
            }
                .padding(.horizontal)
            
        }.navigationBarTitleDisplayMode(.inline)
        }
    }


/*
 struct CoinDetailView_Previews: PreviewProvider {
 static var previews: some View {
     CoinDetailView()
    }
 }
*/


struct SparkLine: View {
    let priceData: [Double]
    let coin: Coin
    @AppStorage("isDarkMode") private var isDarkMode = false

    static let gradientStart = Color(red: 120 / 255, green: 255 / 255, blue: 120.0 / 255)
    static let gradientEnd = Color(red: 120 / 255, green: 255 / 255, blue: 120.0 / 255)

    init(priceData: [Double], coin: Coin) {
        self.priceData = priceData
        self.coin = coin
    }

    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(isDarkMode ? Color.black : Color.white)
                .onTapGesture {
                    // print ("Tap!")
                }

            GeometryReader { geometry in
                Path { path in
                    if !priceData.isEmpty {
                        let minY = priceData.min() ?? 0
                        let maxY = priceData.max() ?? 0
                        let priceRange = maxY - minY

                        for (index, price) in priceData.enumerated() {
                            let x = CGFloat(index) / CGFloat(priceData.count - 1) * geometry.size.width
                            let y = (1 - CGFloat(price - minY) / CGFloat(priceRange)) * geometry.size.height
                            let point = CGPoint(x: x, y: y)

                            if index == 0 {
                                path.move(to: point)
                            } else {
                                path.addLine(to: point)
                            }
                        }
                    }
                }
                .stroke(lineWidth: 2)
                .fill(coin.priceChangePercentage24H > 0 ? Color.green : Color.red)
            }
            .frame(height: 200)
            .background(
                VStack{
                    Divider()
                    Spacer()
                    Divider()
                    Spacer()
                    Divider()
                    
                }
            )
            .overlay(
                VStack(alignment: .leading){
                    HStack{
                        Text(String(format: "%.2f", priceData.max() ?? 0))
                        Spacer()
                        Text("")
                    }
                    Spacer()
                    Text(String(format: "%.2f",(((priceData.max() ?? 0) + (priceData.min() ?? 0)) / 2)  ))
                    Spacer()
                    Text(String(format: "%.2f", priceData.min() ?? 0))
                    
                }
            )
            .bold()
            
        }
    }
    
}


struct ColoredDivider: View {
    var color: Color
    var height: CGFloat

    var body: some View {
        Rectangle()
            .fill(color)
            .frame(height: height)
    }
}
