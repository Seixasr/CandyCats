//
//  Explanation2View.swift
//  TestWwdc
//
//  Created by Rafael Santos Seixas Figueiredo on 22/02/24.
//

import SwiftUI
import Foundation

struct Explanation2View: View {
    
    let images = ["Card Window Mesh", "Card Litter box", "Card Feeder", "Card Toys"]
    let texts = ["texto 1 texto 1 texto 1 texto 1 texto 1 texto 1 texto 1 texto 1 texto 1 texto 1 texto 1 texto 1 texto 1 texto 1 texto 1", "texto 2","texto 3", "texto 4"]
    
    var body: some View {
        NavigationStack{
            VStack{
                TabView(){
                    ForEach(0..<images.count){i in
                        VStack{
                            
                            Image(images[i])
                                .resizable()
                                .frame(width: 330, height: 225)
                                .padding()
                            Spacer()
                            
                            Text(texts[i])
                                .font(.custom("Sobear", size: 24))
                                .foregroundColor(.black)
                                .padding()
                                .frame(width: 360)
                                .background(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)).fill(Color.white))
                            Spacer()
                            
                        }
                        
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .onAppear{
                    indicatorColor()
                }
                NavigationLink{
                    Explanation3View()
                }label:{
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
    
    //Function to change TabView indicator color
    func indicatorColor() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .gray
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.gray.withAlphaComponent(0.2)
    }
}

#Preview {
    Explanation2View()
}
