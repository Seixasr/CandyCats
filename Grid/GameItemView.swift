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
    @State var diffilcuty: Double = 6
    @State var isCompleted: Bool = false
    
    @State var searchColor: Color = Color.clear
    
    //Definir tamanho da matriz
    
    var body: some View {
        VStack {
            Text("Help Pitico!")
                .font(.custom("Sobear", size: 32))
            Text("Fill the cat's needs to proceed")
                .font(.custom("Sobear", size: 18))
                .padding(.bottom, 32)
            
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
                    CircularProgressBarView(progress: Double(redPoints)/diffilcuty, circleColor: defineColor(.t1))
                        .frame(width: 50, height: 50)
                        .padding()
                    if redPoints < Int(diffilcuty) {
                        Text("\(redPoints)/\(Int(diffilcuty))")
                            .font(.custom("Sobear", size: 24))
                    }else{
                        Text("Done")
                            .font(.custom("Sobear", size: 18))
                    }
                    
                }
                VStack{
                    CircularProgressBarView(progress: Double(bluePoints)/diffilcuty, circleColor: defineColor(.t2))
                        .frame(width: 50, height: 50)
                        .padding()
                    if bluePoints < Int(diffilcuty) {
                        Text("\(bluePoints)/\(Int(diffilcuty))")
                            .font(.custom("Sobear", size: 24))
                    }else{
                        Text("Done")
                            .font(.custom("Sobear", size: 18))
                    }
                }
                VStack{
                    CircularProgressBarView(progress: Double(purplePoints)/diffilcuty, circleColor: defineColor(.t4))
                        .frame(width: 50, height: 50)
                        .padding()
                    if purplePoints < Int(diffilcuty) {
                        Text("\(purplePoints)/\(Int(diffilcuty))")
                            .font(.custom("Sobear", size: 24))
                    }else{
                        Text("Done")
                            .font(.custom("Sobear", size: 18))
                    }
                }
                VStack{
                    CircularProgressBarView(progress: Double(greenPoints)/diffilcuty, circleColor: defineColor(.t3))
                        .frame(width: 50, height: 50)
                        .padding()
                    if greenPoints < Int(diffilcuty) {
                        Text("\(greenPoints)/\(Int(diffilcuty))")
                            .font(.custom("Sobear", size: 22))
                    }else{
                        Text("Done")
                            .font(.custom("Sobear", size: 18))
                    }
                }
            }
            .padding(.top, 32)
            .padding(.bottom, 32)
            
            if redPoints >= Int(diffilcuty) && bluePoints >= Int(diffilcuty) && purplePoints >= Int(diffilcuty) && greenPoints >= Int(diffilcuty){
                
                NavigationLink{
                    FinalView()
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
                
            }else{
                ZStack{
                    RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                        .frame(width: 360, height: 70)
                        .foregroundStyle(.gray)
                    
                    Text("Next")
                        .foregroundStyle(.white)
                        .font(.custom("Sobear", size: 40))
                }
                .padding(.bottom, 16)
                .padding(.horizontal, 16)
            }
            Spacer()
            
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
    
    
    
    
