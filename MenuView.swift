//
//  MenuView.swift
//  TestWwdc
//
//  Created by Rafael Santos Seixas Figueiredo on 22/02/24.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack {
            
            Spacer()
            
            Image("logoPitico")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
                .frame(width: 300, height: 300)
            
            Text("Pitico's Care")
                .font(.custom("Sobear", size: 60))
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
            
            Spacer()
            
        }
        
        //Start
        NavigationLink{
            
        }label: {
            ZStack{
                RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                    .frame(width: 360, height: 70)
                    .foregroundStyle(Color(red: 171/255, green: 186/255, blue: 91/255))
                
                Text("Start")
                    .foregroundStyle(.white)
                    .font(.custom("SF Pro Text", size: 40))
            }
            .padding(.horizontal, 16)
        }
        
        //About me
        NavigationLink{
            
        }label: {
            ZStack{
                RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                    .frame(width: 360, height: 70)
                    .foregroundStyle(Color(red: 171/255, green: 186/255, blue: 91/255))
                
                Text("About me")
                    .foregroundStyle(.white)
                    .font(.custom("SF Pro Text", size: 40))
            }
            .padding(.bottom, 16)
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    MenuView()
}
