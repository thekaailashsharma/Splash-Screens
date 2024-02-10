//
//  Netflix.swift
//  Splash Screens
//
//  Created by Admin on 10/02/24.
//

import SwiftUI
import Lottie

struct Netflix: View {
    var body: some View {
        VStack {
            
            MyLottieAnimation(url: Bundle.main.url(forResource: "netflix", withExtension: "lottie")!, loopMode: .loop)

        }.frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .center)
            .ignoresSafeArea()
    }
}

struct Netflix_Previews: PreviewProvider {
    static var previews: some View {
        Netflix()
    }
}
