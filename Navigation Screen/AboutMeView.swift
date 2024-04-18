//
//  AboutMeView.swift
//  TestWwdc
//
//  Created by Rafael Santos Seixas Figueiredo on 22/02/24.
//

import SwiftUI

struct AboutMeView: View {
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                HStack{
                    Image("Rafael about me")
                        .resizable()
                        .frame(width: 170, height: 170)
                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)))
                        .padding(.bottom, 16)
                        .padding(.trailing, 16)
                    
                    Image("Rafael and Pitico 1")
                        .resizable()
                        .frame(width: 170, height: 170)
                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)))
                        .padding(.bottom, 16)
                        
                }
                    Text("My name is Rafael Seixas, I'm from Nova Lima, Minas Gerais. I love videogames and the art of creating them. I study Applied and Computational Mathematics at Unicamp, in Campinas, where I also discovered my passion for cats, especially Pitico. This project is a tribute to him. I've been at the Apple Developer Academy for over a year. I believe that to create games, all it takes is creativity and persistence.")
                        .font(.custom("Sobear", size: 24))
                        .padding()
                        .frame(width: 360)
                        .background(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)).fill(Color.white))
                        .foregroundColor(.black)
                        
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .background(Color("background"))
        }
        
    }
}

#Preview {
    AboutMeView()
}
