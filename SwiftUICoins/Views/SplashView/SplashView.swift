//
//  SplashView.swift
//  SwiftUICoins
//
//  Created by eyüp köse on 10.10.2023.
//

import SwiftUI
import Lottie

struct SplashView: View {
    var body: some View {
        
        
        
        ZStack {
                    Color.cyan

                LottieView(lottieFile: "ani")
                .frame(width: UIScreen.main.bounds.width * 1, height: 300)
                .padding(.bottom,UIScreen.main.bounds.height * 0.15)
                
                Text("Coin List")
                .foregroundColor(.white)
                .padding(.top,UIScreen.main.bounds.height * 0.35)
                .font(.largeTitle)
                .italic()
                .bold()
            
                LottieView(lottieFile: "loading")
                .frame(width: UIScreen.main.bounds.width * 0.35)
                .padding(.top,UIScreen.main.bounds.height * 0.75)
            
                }
                .ignoresSafeArea()
        
           
        
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}

struct LottieView: UIViewRepresentable {
    let lottieFile: String
 
    var animationView = LottieAnimationView()
 
    func makeUIView(context: Context) -> some UIView {
        let view = UIView(frame: .zero)
 
        animationView.animation = LottieAnimation.named(lottieFile)
        animationView.contentMode = .scaleAspectFit
        animationView.play()
        animationView.loopMode = .loop
 
        view.addSubview(animationView)
 
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        animationView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
 
        return view
    }
 
    func updateUIView(_ uiView: UIViewType, context: Context) {
 
    }
}
