//
//  Tutorial2View.swift
//  Pitico's Care
//
//  Created by Rafael Santos Seixas Figueiredo on 23/02/24.
//

import SwiftUI

struct Tutorial2View: View {
    var body: some View {
        NavigationStack{
            VStack{
                Text("The more objects you align, the more points you earn. Those Combos work as follows: 4 aligned - +1 5 aligned - +2 6 aligned - +3 7 aligned - +4")
                    .font(.custom("Sobear", size: 24))
                    .foregroundColor(.black)
                    .padding()
                    .frame(width: 360)
                    .background(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)).fill(Color.white))
                    .padding(.top, 16)
                    .padding(.bottom, 32)
                VStack{
                    HStack{
                        Image("+1 Tutorial")
                            .resizable()
                            .frame(width: 125, height: 110)
                            .padding(16)
                        
                        Image("+2 Tutorial")
                            .resizable()
                            .frame(width: 125, height: 110)
                            .padding(16)
                        
                    }
                    .padding(16)
                    HStack{
                        Image("+3 Tutorial")
                            .resizable()
                            .frame(width: 125, height: 110)
                            .padding(16)
                        
                        Image("+4 Tutorial")
                            .resizable()
                            .frame(width: 125, height: 110)
                            .padding(16)
                        
                    }
                }
                Spacer()
                
                NavigationLink{
                    GameView()
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
    Tutorial2View()
}
