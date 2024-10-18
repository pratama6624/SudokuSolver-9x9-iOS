//
//  SudokuModel.swift
//  SudokuSolver-9x9-iOS
//
//  Created by Pratama One on 18/10/24.
//

import Foundation
import SwiftUI
import Combine

class SudokuModel: ObservableObject {
    @Published var grid: [[String]] = Array(repeating: Array(repeating: "", count: 9), count: 9)
    
    func isValid(_ grid: [[String]], row: Int, col: Int, num: String) -> Bool {
        // Check the rows from left to right
        for i in 0..<9 {
            if grid[row][i] == num { return false }
        }
        
        // Check the columns from top to bottom
        for i in 0..<9 {
            if grid[i][col] == num { return false }
        }
        
        // Check sub columns 3 x 3
        let startRow = row - (row % 3)
        let startCol = col - (col % 3)
        for i in 0..<3 {
            for j in 0..<3 {
                if grid[startRow + i][startCol + j] == num { return false }
            }
        }
        
        return true
    }
    
    func solveWithBacktracking() {
        DispatchQueue.global(qos: .userInitiated).async {
            let solved = self.solveWithDelay()
            if solved {
                // Hanya perbarui UI setelah puzzle terpecahkan
                DispatchQueue.main.async {
                    print("Sudoku solved!")
                }
            } else {
                DispatchQueue.main.async {
                    print("No solution found.")
                }
            }
        }
    }
    
    private func solveWithDelay() -> Bool {
        for row in 0..<9 {
            for col in 0..<9 {
                if grid[row][col] == "" {
                    for num in 1...9 {
                        let strNum = String(num)
                        if self.isValid(grid, row: row, col: col, num: strNum) {
                            
                            DispatchQueue.main.async {
                                self.grid[row][col] = strNum
                            }
                            
                            usleep(200_000)
                            
                            if self.solveWithDelay() {
                                return true
                            }
                            
                            DispatchQueue.main.async {
                                self.grid[row][col] = ""
                            }
                            
                            usleep(200_000)
                        }
                    }
                    return false
                }
            }
        }
        return true
    }
}
