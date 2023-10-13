//
//  OpeningScreen.swift
//  SwiftUICoins
//
//  Created by eyüp köse on 10.10.2023.
//

import SwiftUI

struct OpeningScreen: View {
    
    @State private var showSplash = true
    
    var body: some View {
        if showSplash{
            SplashView()
            //Color(.blue).edgesIgnoringSafeArea(.bottom)
                .animation(.easeInOut(duration: 1.5), value: showSplash) // withAnimation kullanımı
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        withAnimation {
                            self.showSplash = false
                        }
                    }
                    
                }
        }else{
            ContentView()
        }

    }
}

struct OpeningScreen_Previews: PreviewProvider {
    static var previews: some View {
        OpeningScreen()
    }
}
