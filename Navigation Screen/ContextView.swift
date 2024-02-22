//
//  ContextView.swift
//  TestWwdc
//
//  Created by Rafael Santos Seixas Figueiredo on 22/02/24.
//

import SwiftUI

struct ContextView: View {
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                Image("Pitico speaking")
                    .padding(16)

                    Text("My job is to ensure that the homes of future kitten owners are safe for them. But this is not an easy task; it requires a lot of care and attention..")
                        .font(.custom("Sobear", size: 24))
                        .padding()
                        .frame(width: 360)
                        .background(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)).fill(Color.white))
                        .foregroundColor(.black)
                        
                
                Spacer()
                NavigationLink{
                    HelpView()
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
    ContextView()
}
