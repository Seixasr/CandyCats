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
    let texts = [
        "Window meshes are crucial for cat adoption to prevent escapes and falls, avoiding external dangers, disorientation, and stress. It also provides safety and peace of mind.",
        "Cats have the habit of using the litter box due to their nature and instinct to stay clean. They cover their waste with litter with the intention of helping to keep their environment odor-free and more hygienic.",
        "Feeders play a crucial role in the posture of cats, as they are elevated, aligning the mouth, esophagus, and stomach, thereby preventing digestive issues.",
        "Cats can become bored or stressed indoors without adequate stimulation. Providing toys not only entertains them but also promotes physical exercise, helping to prevent health problems associated with sedentary behavior."]
    
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
                                .padding(.bottom, 32)
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
