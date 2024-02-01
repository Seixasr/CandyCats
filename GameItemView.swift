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
    @State var gameBoard = Matrix(numberOfRows: 9, numberOfColumns: 9)
    @State var pieceParts = (row:Int , column:Int ,appearance:Color).self
    
    //Definir tamanho da matrizv
    let numberOfRows:Int = 9
    let numberOfColumns:Int = 9
    
    var body: some View {
        VStack {
            ForEach(0..<gameBoard.board.count) { i in
                HStack {
                    ForEach(0..<gameBoard.board[i].count) { j in
                        Button{
                            returnNeighbor(row: i, column: j, gameBoard: gameBoard)
//                            print("object: row:\(i),column:\(j), color: \(gameBoard.board[i][j].appearence)")
//                            print("object neighbor +1: row:\(i+1),column:\(j+1), color: \(gameBoard.board[i+1][j+1].appearence)")
                        } label:{
                            Rectangle()
                                .frame(width: 30, height: 30) //
                                .foregroundColor(gameBoard.board[i][j].appearence)
                            
                        }
                        
                    }
                }
            }
        }
        .onAppear {
            
        }
    }
}




