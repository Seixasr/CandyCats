//
//  GameItemView.swift
//  TestWwdc
//
//  Created by Rafael Santos Seixas Figueiredo on 01/02/24.
//

import Foundation
import SwiftUI



struct generateRandomColorMatrix: View {
    @State var rowIndex = 0
    @State var columnIndex = 0
//    @StateObject private var gameBoardManager = GameBoardManager()
    @ObservedObject var gameBoard = GameBoardManager()
    @State var pieceParts = (Color).self
    
    //Definir tamanho da matrizv
    let numberOfRows:Int = 9
    let numberOfColumns:Int = 9
    
    var body: some View {
        VStack {
            ForEach(0..<gameBoard.gameBoard.board.count) { i in
                HStack {
                    ForEach(0..<gameBoard.gameBoard.board[i].count) { j in
                        Button{
                            
                            changePosition(row: i, column: j, manager: gameBoard)
                           

                        } label:{
                            Rectangle()
                                .frame(width: 30, height: 30) //
                                .foregroundColor(gameBoard.gameBoard.board[i][j].appearence)
                            
                        }
                        
                    }
                }
            }
        }
        .onAppear {
            
        }
    }
}




