//
//  GameMechanics.swift
//  TestWwdc
//
//  Created by Rafael Santos Seixas Figueiredo on 01/02/24.
//

import Foundation
import SwiftUI

var clickedObjects: [HouseObject] = []
var rowClickedObejects: [Int] = []
var columnClickedObejects: [Int] = []

func changePosition(row: Int, column: Int, manager: GameBoardManager){
    
    var gameBoard = manager.gameBoard
    
    clickedObjects.append(gameBoard.board[row][column])
    rowClickedObejects.append(gameBoard.board[row].count)
    columnClickedObejects.append(gameBoard.board[column].count)
    
    
    if clickedObjects.count == 1{
        print("First Object Clicked: \(clickedObjects[0].appearence)")
        //        print("row:\(gameBoard.board[row][column].row), column: \(gameBoard.board[row][column].column)")
    }
    
    if clickedObjects.count == 2{
        print("Second Object Clicked: \(clickedObjects[1].appearence)")
        
        //Verificar se os dois clicados sao vizinhos
        returnNeighbor(row1: rowClickedObejects[0], column1: columnClickedObejects[0], row2: rowClickedObejects[1], column2: columnClickedObejects[1], gameBoard: gameBoard)
        clickedObjects.removeAll()
        rowClickedObejects.removeAll()
        columnClickedObejects.removeAll()
    }
    
    
    
            
            
//
//                if clickedObjects[0] == clickedObjects[1].row || clickedObjects[0].column == clickedObjects[1].column{
//                    
//                    position1.append(clickedObjects[0])
//                    position1.append(clickedObjects[0].column)
//                    position2.append(clickedObjects[1].row)
//                    position2.append(clickedObjects[1].column)
//                    
//                    //        position1 = (clickedObjects[0].row, clickedObjects[0].column)
//                    //        position2 = (clickedObjects[1].row, clickedObjects[1].column)
//                    
//                    print(position1)
//                    
//                    print(position2)
//                    
//                    //Trocar na mao
//                    
//                   // gameBoard.board.swapAt(position1[0], position2[0])
//                   // gameBoard.board[row].swapAt(position1[1], position2[1])
//                    
//                    
//                    //Como acessar as duas posicoes para troca-las?
//                    var appearence1 = gameBoard.board[clickedObjects[0].row][clickedObjects[0].column].appearence
//                    var appearence2 = gameBoard.board[clickedObjects[1].row][clickedObjects[1].column].appearence
//                    
//                    gameBoard.board[clickedObjects[0].row][clickedObjects[0].column].appearence = appearence2
//                    gameBoard.board[clickedObjects[1].row][clickedObjects[1].column].appearence = appearence1
//                    
//                    
//                    manager.gameBoard.board = gameBoard.board
//
//                    
//                    print("1: \(position1), 2: \(position2)")
//                    print("Pos atualizacao - 1: \(gameBoard.board[clickedObjects[0].row][clickedObjects[0].column].row), \(gameBoard.board[clickedObjects[0].row][clickedObjects[0].column].column) || 2: \(gameBoard.board[clickedObjects[1].row][clickedObjects[1].column].row), \(gameBoard.board[clickedObjects[1].row][clickedObjects[1].column].column)")
//                    
//                    print("Pos atualizacao - 1: \(manager.gameBoard.board[clickedObjects[0].row][clickedObjects[0].column].row), \(manager.gameBoard.board[clickedObjects[0].row][clickedObjects[0].column].column) || 2: \(manager.gameBoard.board[clickedObjects[1].row][clickedObjects[1].column].row), \(manager.gameBoard.board[clickedObjects[1].row][clickedObjects[1].column].column)")
//                    
//                    clickedObjects.removeAll()
//                    position1.removeAll()
//                    position2.removeAll()
//                    
//                    manager.gameBoard = gameBoard
//                    
//                }else{
//                    position1.append(clickedObjects[0].row)
//                    position1.append(clickedObjects[0].column)
//                    position2.append(clickedObjects[1].row)
//                    position2.append(clickedObjects[1].column)
//                    
//                    print(position1)
//                    
//                    print(position2)
//                    
//                    print(gameBoard.board[row][column].appearence)
//        //            let board = gameBoard.board
//        //            gameBoard.board = board
//        //
//        //            manager.gameBoard = gameBoard
//                    clickedObjects.removeAll()
//                    position1.removeAll()
//                    position2.removeAll()
//                    let board = gameBoard.board
//                    gameBoard.board = board
//                    
//                    manager.gameBoard = gameBoard
//                    print("Não é possível trocar com a diagonal")
//                }
//        //
//                
//        //        let remove = gameBoard.board[row].swapAt(gameBoard.board[row][column].count, gameBoard.board[row][column+1].count)
//            }
//            
//            if clickedObjects.count == 3{
//                
//                clickedObjects.append(clickedObject)
//                
//                print("First Object Clicked: \(clickedObjects[0].appearence)")
//            }
//            
//            
//        }
//    }
    
    
    
    
//    if let existingObject = clickedObjects.first {
//        // Two objects are already clicked, reset the array
//        //clickedObjects = []
//        print("First Object: \(existingObject.appearence)")
//        print("Second Object: \(clickedObject.appearence)")
//    } else {
//        // Add the first clicked object to the array
//    }
}
