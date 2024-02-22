//
//  Explanation1View.swift
//  TestWwdc
//
//  Created by Rafael Santos Seixas Figueiredo on 22/02/24.
//

import SwiftUI

struct Explanation1View: View {
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                    Image("Pitico speaking")
                    .padding(.bottom, 32)
                
                Text("\(Text("Great! Let's get started. We need to consider 4 things for the house to be ready:").coloredText(.black)) \(Text("Window Meshes,").coloredText(Color("gridBlue")))\(Text("Feeders").coloredText(Color("gridGreen"))) \(Text("Litter Boxes, ").coloredText(Color("gridPurple")))\(Text("and ").coloredText(.black))\(Text("Toys. ").coloredText(Color("gridOrange")))\(Text("Each one directly impacts our little friend's life. You can see more about them if you want.").coloredText(.black))")
                            .font(.custom("Sobear", size: 24))
                            .foregroundColor(.black)
                            .padding()
                            .frame(width: 360)
                            .background(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)).fill(Color.white))
                            
                        
                        
                Spacer()
                
                NavigationLink{
                    Explanation2View()
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

extension Text {
    func coloredText(_ color: Color) -> Text {
        self.foregroundColor(color)
    }
}

#Preview {
    Explanation1View()
}
