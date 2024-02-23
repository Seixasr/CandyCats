//
//  FinalView.swift
//  TestWwdc
//
//  Created by Rafael Santos Seixas Figueiredo on 22/02/24.
//

import SwiftUI

struct FinalView: View {
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                    Image("Final Scene")
                        .padding(.bottom, 32)
                
                Text("Very good! Now Amora found her Home sweet e home, and is also my turn to play. Thank you for your help! See you later!")
                            .font(.custom("Sobear", size: 24))
                            .foregroundColor(.black)
                            .padding()
                            .frame(width: 360)
                            .background(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)).fill(Color.white))
                            
                        
                        
                Spacer()
                
                NavigationLink(destination: MenuView().navigationBarBackButtonHidden(true)){
                    ZStack{
                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                            .frame(width: 360, height: 70)
                            .foregroundStyle(Color(red: 171/255, green: 186/255, blue: 91/255))
                        
                        Text("Finish")
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
    FinalView()
}
