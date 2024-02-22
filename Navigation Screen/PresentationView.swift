//
//  PresentationView.swift
//  TestWwdc
//
//  Created by Rafael Santos Seixas Figueiredo on 22/02/24.
//

import SwiftUI

struct PresentationView: View {
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                Image("Pitico Tela 1")
                    .padding(16)
                ZStack{
                    RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                        .frame(width: 360, height: 150)
                        .foregroundColor(Color(.white))
                    Text("Hello, my name is Pitico, and I work for the Welcoming Cats Association (WCA).")
                        .font(.custom("Sobear", size: 24))
                        .foregroundColor(.black)
                        .padding(16)
                }
                Spacer()
                NavigationLink{
                    
                }label: {
                    ZStack{
                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                            .frame(width: 360, height: 70)
                            .foregroundStyle(Color(red: 171/255, green: 186/255, blue: 91/255))
                        
                        Text("Next")
                            .foregroundStyle(.white)
                            .font(.custom("Sobear", size: 40))
                    }
                    .padding(.bottom, 16)
                    .padding(.horizontal, 16)
                }
            }
            .background(Color("background"))
        }
    }
}

#Preview {
    PresentationView()
}
