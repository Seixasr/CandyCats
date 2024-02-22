//
//  Explanation3View.swift
//  TestWwdc
//
//  Created by Rafael Santos Seixas Figueiredo on 22/02/24.
//

import SwiftUI

struct Explanation3View: View {
    
    @State private var gameBoard = GameBoardManager()
    var body: some View {
        NavigationStack{
            VStack{
//                Spacer()
                
                Text("Here at WCA, we use very advanced (and fun) technology to adapt homes. We call it “the Grid”.")
                    .font(.custom("Sobear", size: 24))
                    .foregroundColor(.black)
                    .padding()
                    .frame(width: 360)
                    .background(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)).fill(Color.white))
                    .padding(.top, 16)
                    .padding(.bottom, 32)

                
                VStack{
                    ForEach(0..<gameBoard.gameBoard.board.count) { i in
                        HStack {
                            ForEach(0..<gameBoard.gameBoard.board[i].count) { j in
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 44, height: 44) //
                                    .foregroundColor(gameBoard.gameBoard.board[i][j].appearence)
                            }
                        }
                    }
                    
                }
                
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

#Preview {
    Explanation3View()
}
