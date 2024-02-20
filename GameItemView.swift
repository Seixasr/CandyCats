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
    @State var redPoints: Int = 0
    @State var bluePoints: Int = 0
    @State var yellowPoints: Int = 0
    @State var greenPoints: Int = 0
    @State var points: Int = 0

    @State var searchColor: Color = Color.clear
    
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
                            
                            let connect4 = connect4Row(row: i, column: j,manager: gameBoard, redPoints: redPoints, bluePoints: bluePoints, greenPoints: greenPoints, yellowPoints: yellowPoints, color: searchColor)
                            
                            points = connect4.0
                            searchColor = connect4.1
                            
                            switch searchColor {
                            case .red:
                                redPoints += points
                            case .blue:
                                bluePoints += points
                            case .yellow:
                                yellowPoints += points
                            case .green:
                                greenPoints += points
                            default:
                                break
                            }
                            
                        } label:{
                            Rectangle()
                                .frame(width: 30, height: 30) //
                                .foregroundColor(gameBoard.gameBoard.board[i][j].appearence)
                        }
                        
                    }
                }
            }
            HStack{
                CircularProgressBarView(progress: Double(redPoints)/20, circleColor: Color.red)
                    .frame(width: 50, height: 50)
                    .padding()
                CircularProgressBarView(progress: Double(bluePoints)/20, circleColor: Color.blue)
                    .frame(width: 50, height: 50)
                    .padding()
                CircularProgressBarView(progress: Double(yellowPoints)/20, circleColor: Color.yellow)
                    .frame(width: 50, height: 50)
                    .padding()
                CircularProgressBarView(progress: Double(greenPoints)/20, circleColor: Color.green)
                    .frame(width: 50, height: 50)
                    .padding()
            }
        }
    }
}




