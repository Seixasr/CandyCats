//
//  HelpView.swift
//  
//
//  Created by Rafael Santos Seixas Figueiredo on 22/02/24.
//

import SwiftUI

struct HelpView: View {
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                ZStack{
                    Image("Pitico smile")
                        .padding(.trailing, 100)
                    Image("Amora")
                        .padding(.leading, 240)
                        .padding(.bottom, 180)
                }

                    Text("I need you help to prepare a home to welcome our dear friend Amora.")
                        .font(.custom("Sobear", size: 24))
                        .padding()
                        .frame(width: 360)
                        .background(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)).fill(Color.white))
                        .foregroundColor(.black)
                        

                Spacer()
                
                NavigationLink{
                    Explanation1View()
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
    HelpView()
}
