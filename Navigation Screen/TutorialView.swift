//
//  TutorialView.swift
//  TestWwdc
//
//  Created by Rafael Santos Seixas Figueiredo on 22/02/24.
//

import SwiftUI

struct TutorialView: View {
    var body: some View {
        NavigationStack{
            VStack{
                Text("Click in two pieces to switch their places. Gather 4 or more pieces, horizontally, of the corresponding color for each item we analyzed. When you gather them, you score points. Gather enough to fill up the safety meters for Amora to find his new family. Let's do it!")
                    .font(.custom("Sobear", size: 24))
                    .foregroundColor(.black)
                    .padding()
                    .frame(width: 360)
                    .background(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)).fill(Color.white))
                    .padding(.top, 16)
                    .padding(.bottom, 32)
                
                Image("Line Tutorial")
                    .resizable()
                    .frame(width:350 ,height: 144)
                    .padding(.bottom, 16)
                Image("+1 Tutorial")
                    .resizable()
                    .frame(width: 125, height: 110)
                
                
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
    TutorialView()
}
