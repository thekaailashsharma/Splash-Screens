//
//  HotstarSplash.swift
//  Splash Screens
//
//  Created by Admin on 10/02/24.
//

import SwiftUI

struct HotstarSplashiPAD: View {
    
    @State var startAnimation = false
    @State var bowAnimation = false
    @State var glow = false
    @State var hotstar = false
    @State private var scale = 1.0
    
    var body: some View {
        ZStack {
            Color("BG")
                .ignoresSafeArea()
            
            GeometryReader { proxy in
                let size = proxy.size
                
                ZStack {
                    
                    Circle()
                        .trim(from: 0, to: bowAnimation ? 0.5 : 0)
                        .stroke(
                            .linearGradient(
                                .init(colors:
                                        [
                                            Color("Gradient1"),
                                            Color("Gradient2"),
                                            Color("Gradient3"),
                                            Color("Gradient5"),
                                            Color("Gradient5")
                                                .opacity(0.5),
                                            Color("BG"),
                                            Color("BG"),
                                            Color("BG"),
                                        ]
                                     ), startPoint: .leading, endPoint: .trailing)
                            ,style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round)
                        )
//                        .frame(width: size.width / 3.4,height: size.width / 3.4)
                        .frame(width: size.width / 1.6,height: size.width / 1.4)
                        .foregroundColor(.black)
                        .overlay(
                            Circle()
                                .fill(.white.opacity(0.6))
                                .frame(width: 6,height: 6)
                                .overlay(
                                    Circle()
                                        .fill(.white.opacity(glow ? 0.2: 0.1))
                                        .frame(width: 20,height: 20)
                                )
                            
                                .blur(radius: 2.5)
                                .offset(x: (size.width / 1.6) / 2,y: 25)
                                .rotationEffect(.init(degrees: bowAnimation ? 180 : 0))
                        )
                        .rotationEffect(.init(degrees: -200))
                        .offset(x: 65, y: -150)
//                        .offset(x: 15, y: 0)
                    
                    
                    
                    VStack(alignment: .leading) {
//                        HStack(spacing: -55) {
                        HStack(spacing: -25) {
                            Image("Disney")
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: size.width / 1.9, height: size.width / 1.9)
                                .opacity(startAnimation ? 1: 0)
                            
                            Image("plus")
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .offset(x: -37)
                            
                        }
                        .offset(y: (size.width / 1.4) / 2)
                        .foregroundColor(.white)
                        
                        Image("hotstar")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350, height: 350)
                            .opacity(hotstar ? 1: 0)
                            .scaleEffect(scale)
                            .animation(.linear(duration: 1), value: scale)
//                            .offset(x: 100, y: -380)
                            .offset(x: 0, y: -80)
                            .foregroundColor(.white)
                        
                    }
                }
                .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .center)
            }
        }
        .onAppear {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                withAnimation(.linear(duration: 2)){
                    bowAnimation.toggle()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
                        hotstar.toggle()
                        scale += 0.5
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                            scale -= 0.3
                        }
                    }
                }
                
                withAnimation(.linear(duration: 1).repeatForever(autoreverses: true)) {
                    glow.toggle()
                }
                
                withAnimation(.spring()) {
                    startAnimation.toggle()
                }
                
                
            }
            
        }
        .background(Color("BG"))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
    }
}

struct HotstarSplashiPad_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPad Pro (11-inch) (4th generation)"))
    }
}
