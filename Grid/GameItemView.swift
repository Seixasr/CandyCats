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
    @State var purplePoints: Int = 0
    @State var greenPoints: Int = 0
    @State var points: Int = 0

    @State var searchColor: Color = Color.clear
    
    //Definir tamanho da matriz
    
    var body: some View {
        VStack {
            ForEach(0..<gameBoard.gameBoard.board.count) { i in
                HStack {
                    ForEach(0..<gameBoard.gameBoard.board[i].count) { j in
                        Button{
                            changePosition(row: i, column: j, manager: gameBoard)
                            
                            let connect4 = connect4Row(row: i, column: j,manager: gameBoard)
                            
                            points = connect4.0
                            searchColor = connect4.1
                            
                            switch searchColor {
                            case defineColor(.t1):
                                redPoints += points
                            case defineColor(.t2):
                                bluePoints += points
                            case defineColor(.t4):
                                purplePoints += points
                            case defineColor(.t3):
                                greenPoints += points
                            default:
                                break
                            }
                            
                        } label:{
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 44, height: 44) //
                                .foregroundColor(gameBoard.gameBoard.board[i][j].appearence)
                        }
                        
                    }
                }
            }
            HStack{
                VStack{
                    CircularProgressBarView(progress: Double(redPoints)/10, circleColor: defineColor(.t1))
                        .frame(width: 50, height: 50)
                        .padding()
                    Text("\(redPoints)/10")
                }
                VStack{
                    CircularProgressBarView(progress: Double(bluePoints)/20, circleColor: defineColor(.t2))
                        .frame(width: 50, height: 50)
                        .padding()
                    Text("\(bluePoints)/10")
                }
                VStack{
                    CircularProgressBarView(progress: Double(purplePoints)/20, circleColor: defineColor(.t4))
                        .frame(width: 50, height: 50)
                        .padding()
                    Text("\(purplePoints)/10")
                }
                VStack{
                    CircularProgressBarView(progress: Double(greenPoints)/20, circleColor: defineColor(.t3))
                        .frame(width: 50, height: 50)
                        .padding()
                    Text("\(greenPoints)/10")
                }
            }
        }
    }
}

struct CircularProgressBarView: View{
    private let progress: Double
    private let circleColor: Color
        
    init(progress: Double, circleColor: Color) {
            self.progress = progress
            self.circleColor = circleColor
        }
    
    var body: some View{
        ZStack{
            Circle()
                .stroke(Color.gray.opacity(0.2), style: StrokeStyle(lineWidth: 10, lineCap: .round))

            Circle()
                .trim(from: 0.0, to: progress)
                .stroke(circleColor, style: StrokeStyle(lineWidth: 10, lineCap: .round))
                .animation(.easeInOut)
                .rotationEffect(Angle(degrees: -90))
            
        }
    }
}




