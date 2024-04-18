//
//  MenuView.swift
//  TestWwdc
//
//  Created by Rafael Santos Seixas Figueiredo on 22/02/24.
//

import SwiftUI

struct MenuView: View {
//    @Environment(\.colorScheme) var colorScheme
//        let light: Image
//        let dark: Image

    var body: some View {
        
        NavigationStack {
            
            VStack {
                VStack {
                    
                    Spacer()
                    Image("logoPitico")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 300)
                   
                    Text("Pitico's Care")
                        .font(.custom("Sobear", size: 60))
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                }
                //Start
                NavigationLink{
                    PresentationView()
                }label: {
                    ZStack{
                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                            .frame(width: 360, height: 70)
                            .foregroundStyle(Color(red: 171/255, green: 186/255, blue: 91/255))
                        
                        Text("Start")
                            .foregroundStyle(.white)
                            .font(.custom("Sobear", size: 40))
                    }
                    .padding(.horizontal, 16)
                }
                
                //About me
                NavigationLink{
                    AboutMeView()
                }label: {
                    ZStack{
                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                            .frame(width: 360, height: 70)
                            .foregroundStyle(Color(red: 171/255, green: 186/255, blue: 91/255))
                        
                        Text("About me")
                            .foregroundStyle(.white)
                            .font(.custom("Sobear", size: 40))
                    }
                    .padding(.bottom, 16)
                    .padding(.horizontal, 16)
                }
            }
            .frame(maxWidth: .infinity)
            .background(Color("background"))
        }
    }
}

#Preview {
    MenuView()
}
