import SwiftUI

struct SearchView: View {
    
    @StateObject var viewModel = HomeViewModel()
    @AppStorage("isDarkMode") private var isDarkMode = false
    @State private var search: String = ""
    
    var body: some View {
        
        NavigationView{
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    //Search TextField
                    
                    
                    HStack {
                        TextField("Search any crypto coins...", text: $search)
                            .foregroundColor(.black)
                            .font(.headline)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(isDarkMode ? .gray : Color(red: 0.949, green: 0.949, blue: 0.949))
                                    .shadow(
                                        color: .gray.opacity(0.75),
                                        radius: 10, x: 0, y: 0)
                            )
                            .onChange(of: search ) { newValue in
                               viewModel.filterCoins(searchText: newValue)
                            }
                            
                        
                        Image(systemName: "magnifyingglass")
                            .onTapGesture {
                                
                                print(search)
                            }
                            .font(.headline)
                            .bold()
                    }.padding()
                        
                    
                    Divider()
                        .frame(height: 0.4)
                        .background(isDarkMode ? .white : .gray)
                    
                    HStack{
                       TopMarkCapCoin()
                    }
                    
                    Divider()
                        .frame(height: 0.4)
                        .background(isDarkMode ? .white : .gray)
                    
                    //All coins
                    
                    ScrollView{
                        VStack(spacing: 20){
                            ForEach(viewModel.filteredCoins) { coin in
                                NavigationLink(destination: CoinDetailView(coin: coin)) {
                                    SearchViewItem(coin: coin)
                                }
                                
                            }
                        }
                    }

                }
            }
        }
    }
}

