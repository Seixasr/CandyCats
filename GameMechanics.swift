//
//  GameMechanics.swift
//  TestWwdc
//
//  Created by Rafael Santos Seixas Figueiredo on 01/02/24.
//

import Foundation
import SwiftUI

var clickedObjects: [HouseObject] = []
var position1:[Int] = []
var position2:[Int]  = []

func changePosition(row: Int, column: Int, manager: GameBoardManager){
    
    let gameBoard = manager.gameBoard

    let clickedObject = gameBoard.board[row][column]
    var row1 = 0
    var column1 = 0
    
    clickedObjects.append(clickedObject)
    if clickedObjects.count == 1{
        print("First Object Clicked: \(clickedObjects[0].appearence)")
//        print("row:\(gameBoard.board[row][column].row), column: \(gameBoard.board[row][column].column)")
        row1 = gameBoard.board[row][column].row
        column1 = gameBoard.board[row][column].column
    }
    
    if clickedObjects.count == 2{
        print("Second Object Clicked: \(clickedObjects[1].appearence)")
        
        position1.append(clickedObjects[0].row)
        position1.append(clickedObjects[0].column)
        position2.append(clickedObjects[1].row)
        position2.append(clickedObjects[1].column)
        
//        position1 = (clickedObjects[0].row, clickedObjects[0].column)
//        position2 = (clickedObjects[1].row, clickedObjects[1].column)
        
        print(position1)
        
        print(position2)
        
        print(gameBoard.board[row][column].appearence)
        
        //Trocar na mao

        gameBoard.board.swapAt(position1[0], position2[0])
        gameBoard.board[row].swapAt(position1[1], position2[1])
        
        clickedObjects[0].row = position2[0]
        clickedObjects[0].column = position2[1]
        
        clickedObjects[1].row = position1[0]
        clickedObjects[1].column = position1[1]
        
//        print(gameBoard.board[row][column].appearence)
        
        let board = gameBoard.board
        gameBoard.board = board
        
        manager.gameBoard = gameBoard
        clickedObjects.removeAll()
        position1.removeAll()
        position2.removeAll()
//
        
//        let remove = gameBoard.board[row].swapAt(gameBoard.board[row][column].count, gameBoard.board[row][column+1].count)
    }
    
    if clickedObjects.count == 3{
        
        clickedObjects.append(clickedObject)
        
        print("First Object Clicked: \(clickedObjects[0].appearence)")
    }
    
    
    
//    if let existingObject = clickedObjects.first {
//        // Two objects are already clicked, reset the array
//        //clickedObjects = []
//        print("First Object: \(existingObject.appearence)")
//        print("Second Object: \(clickedObject.appearence)")
//    } else {
//        // Add the first clicked object to the array
//    }
}
