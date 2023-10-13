//
//  Portfolio.swift
//  SwiftUICoins
//
//  Created by eyüp köse on 4.10.2023.
//

import SwiftUI
import Kingfisher

struct PortfolioView: View {
    @StateObject var viewModel = HomeViewModel()
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    @State private var isAddTransactionSheetPresented = false
    @State private var search: String = ""
    @State var adet: Int? = nil
    @State var selectionCoin: Coin
    
    @State var data : [PortfolioActivity] = []
   
    @State private var nameString: [String] = []
    @State private var priceDoubles: [Double] = []

    
    
    func savePortfolioData() {
        let encodedData = try? JSONEncoder().encode(data)
        UserDefaults.standard.set(encodedData, forKey: "portfolioData")
    }
    
    
    let colors : [Color] = [.blue,.purple,.green,.red]
    
    /*
    var values: [Double] {
        return calculateValues()
    }
    
    var names: [String] {
        return data.map { String($0.symbol) }
    }
    
    func calculateValues() -> [Double] {
        return data.map { Double($0.adet) }
    }
    */
    
    
    var body: some View {
        
        VStack{
            
            // İnvestment part
            VStack{
                
                HStack {
                    Text("Total assets allocation")
                        .fontWeight(.semibold)
                        .font(.title3)
                        .onTapGesture {
                            print(data.map{$0.price})
                        }
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                //Pie Chart
                VStack {
                    HStack{
                        PieChartView(values: self.priceDoubles, names: self.nameString, formatter: {value in String(format: "$%.2f", value)}, colors: colors, backgroundColor: isDarkMode ? .black : .white)
                            .frame(width: 300)
                        }
                    .frame(width: UIScreen.main.bounds.width, height: 300)
                }
                
                
              //--------
              VStack(alignment: .leading){
                    Text("Your Assets")
                        .fontWeight(.semibold)
                        .font(.title3)
                    
                    .padding(.horizontal)
                    
                    HStack{
                        Text("Asset")
                            .font(.caption)
                            .foregroundColor(.gray)
                        Spacer()
                        Text("Holdings")
                            .font(.caption)
                            .foregroundColor(.gray)
                        Spacer()
                        Text("Price(USD)")
                            .font(.caption)
                            .foregroundColor(.gray)
                        Spacer()
                        Text("")
                    }
                    
                    .padding(.horizontal)
                    
                    ScrollView {
                        ForEach(data, id: \.id) { item in
                            HStack {
                                HStack {
                                    KFImage(URL(string: item.image))
                                        .resizable()
                                        .frame(width: 30,height: 30)
                                    Text(item.symbol.uppercased())
                                        .bold()
                                }
                                Spacer()
                                Text("\(item.adet)")
                                Spacer()
                                Text("\(item.price.toCurrency())")
                                Spacer()
                                Button(action: {
                                    if let selectedIndex = data.firstIndex(where: { $0.id == item.id }) {
                                           data.remove(at: selectedIndex)
                                           savePortfolioData() // Veriyi güncelle
                                       }
                                }) {
                                    Image(systemName: "trash")
                                }
                            }
                            .padding(.horizontal)
                            .padding(.vertical,4)
                        }
                    }
                }
                .padding(.top,82)
               
                
                
                //Sheet screen
                
                Spacer()
                // Button Stack
                VStack{
                    Button {
                        isAddTransactionSheetPresented.toggle()
                    } label: {
                        Text("Add Transaction")
                            .foregroundColor(.white)
                            .font(.title3)
                            .padding(.horizontal)
                            .padding(.vertical,8)
                    }
                }
                .background(.blue)
                .clipShape(Capsule())
                .sheet(isPresented: $isAddTransactionSheetPresented){
                    
                    VStack{
                        VStack{
                            TextField("Search any crypto coins...", text: $search)
                                .foregroundColor(.black)
                                .font(.headline)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(isDarkMode ? .gray : Color(red: 0.949, green: 0.949, blue: 0.949))
                                        .shadow(
                                            color: .gray.opacity(0.75),
                                            radius: 10, x: 0, y: 0)
                                )
                                .onChange(of: search ) { newValue in
                                    viewModel.filterCoins(searchText: newValue)
                                }
                        }
                        .padding(.horizontal,10)
                        .padding(.top,8)
                        
                        //Coin list view
                        VStack{
                            ScrollView(.horizontal, showsIndicators: false){
                                HStack(spacing: 20){
                                    ForEach(viewModel.filteredCoins) { coin in
                                        
                                        Button(action: {
                                            selectionCoin = coin
                                        }) {
                                            TopMoversItemView(coin: coin)
                                        }
                                    }
                                }
                            }
                            
                        }
                        .padding(.bottom,30)
                        .padding(.horizontal)
                        
                        HStack {
                            Text("Current price of \(selectionCoin.symbol.uppercased())")
                            
                            Spacer()
                            
                            Text("$\(selectionCoin.currentPrice)")
                        }
                        .padding(.horizontal)
                        
                        Divider()
                        
                        HStack {
                            Text("Assets Holdings ")
                            
                            TextField("Assets Holdings", text: Binding(get: {
                                String(adet ?? 0)
                            }, set: { newValue in
                                if let value = Int(newValue) {
                                    adet = value
                                }
                            }))
                            .padding(.leading,150)
                        }
                        .padding(.horizontal)
                        .padding(.top,10)
                        
                        Divider()
                        
                        HStack {
                            Text("Current Value")
                            
                            Spacer()
                            
                            Text("$\(Double(adet ?? 0) * selectionCoin.currentPrice)")
                            
                        }
                        .padding(.horizontal)
                        .padding(.top,10)
                        
                        Spacer()
                        
                        //add button
                        VStack{
                            Button {
                                let newActivity = PortfolioActivity(symbol: selectionCoin.symbol, adet: adet ?? 0, price: (Double(adet ?? 0) * selectionCoin.currentPrice), image: selectionCoin.image)
                                
                                
                                

                                    // Daha önce kaydettiğiniz verileri burada `data` dizisine ekleyin
                                    if let storedData = UserDefaults.standard.data(forKey: "portfolioData") {
                                        if var decodedData = try? JSONDecoder().decode([PortfolioActivity].self, from: storedData) {
                                            decodedData.append(newActivity)
                                            data = decodedData
                                        } else {
                                            data.append(newActivity)
                                        }
                                    } else {
                                        data.append(newActivity)
                                    }

                                    savePortfolioData()
                                    isAddTransactionSheetPresented = false
                            } label: {
                                RoundedRectangle(cornerRadius: 14)
                                    .fill(Color.blue)
                                    .frame(width: 100, height: 40)
                                    .overlay(
                                        HStack {
                                            Text("Finish")
                                            Image(systemName: "checkmark")
                                        }
                                        .foregroundColor(.white)
                                    )
                            }
                            
                        }
                        .padding(.bottom,40)
                    }
                   
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                    .presentationDetents([.medium])
                }
            }
            .padding(.bottom,20)
        }
        .onChange(of: data, perform: { newValue in
            priceDoubles = newValue.map{$0.price}
            nameString = newValue.map{$0.symbol.uppercased()}
        })
        .onAppear {
            if data.isEmpty {
                // Eğer `data` boşsa, yani daha önce hiç veri eklenmediyse, depolamadan verileri çekin
                if let storedData = UserDefaults.standard.data(forKey: "portfolioData") {
                    if let decodedData = try? JSONDecoder().decode([PortfolioActivity].self, from: storedData) {
                        data = decodedData
                        priceDoubles = data.map{$0.price}
                        nameString = data.map{$0.symbol.uppercased()}
                    }
                }
            }else{
                
            }
        }
    }

    
}






/*
 struct Portfolio_Previews: PreviewProvider {
 static var previews: some View {
 Portfolio()
 }
 }
 */

