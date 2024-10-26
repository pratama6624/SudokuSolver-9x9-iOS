//
//  ContentView.swift
//  SudokuSolver-9x9-iOS
//
//  Created by Pratama One on 17/10/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var sudokuModel = SudokuModel()
    
    let initialClues: [(row: Int, col: Int, value: Int)] = [
        // Easy Level
//            (0, 1, 1), (0, 2, 9), (0, 6, 8),
//            (1, 1, 8), (1, 3, 7), (1, 4, 6), (1, 5, 9), (1, 8, 1),
//            (2, 0, 7), (2, 6, 2), (2, 8, 9),
//            (3, 1, 3), (3, 3, 4), (3, 5, 8), (3, 6, 7),
//            (4, 0, 4), (4, 1, 7), (4, 2, 5), (4, 3, 1), (4, 5, 6), (4, 6, 3), (4, 7, 8), (4, 8, 2),
//            (5, 2, 8), (5, 3, 3), (5, 5, 7), (5, 7, 5),
//            (6, 0, 3), (6, 2, 4), (6, 8, 5),
//            (7, 0, 9), (7, 3, 5), (7, 4, 7), (7, 5, 3), (7, 7, 2),
//            (8, 2, 7), (8, 6, 6), (8, 7, 1)
        
        // Medium Level
//            (0, 1, 9), (0, 2, 8), (0, 4, 5),
//            (1, 3, 6), (1, 5, 8), (1, 7, 7),
//            (2, 0, 2), (2, 2, 6), (2, 5, 4), (2, 6, 8), (2, 7, 3), (2, 8, 5),
//            (3, 0, 7), (3, 1, 2), (3, 3, 8), (3, 5, 5), (3, 7, 4),
//            (4, 1, 8), (4, 3, 1), (4, 5, 2), (4, 7, 6),
//            (5, 1, 1), (5, 3, 4), (5, 5, 7), (5, 7, 2), (5, 8, 8),
//            (6, 0, 8), (6, 1, 4), (6, 2, 9), (6, 3, 2), (6, 6, 6), (6, 8, 3),
//            (7, 1, 5), (7, 3, 3), (7, 5, 6),
//            (8, 4, 4), (8, 6, 7), (8, 7, 8)
        
        // Extreme Level
//            (0, 2, 7), (0, 3, 3), (0,7, 2),
//            (1, 4, 9), (1, 6, 1),
//            (3, 0, 4), (3, 2, 5), (3, 4, 8), (3, 6, 9),
//            (4, 7, 6), (4, 8, 7),
//            (5, 0, 8),
//            (6, 3, 2), (6, 5, 6),
//            (7, 0, 9), (7, 8, 3),
//            (8, 3, 7)
        ]

    init() {
        for clue in initialClues {
            sudokuModel.grid[clue.row][clue.col] = String(clue.value)
        }
    }
    
    var body: some View {
        VStack {
            Text("SUDOKU BOARD [9 x 9]")
                .bold()
                .font(.title)
                .padding(.bottom, 30)
            
            ForEach(0..<9, id: \.self) { row in
                HStack {
                    ForEach(0..<9, id: \.self) { col in
                        SudokuBoardTextField(row: row, col: col, sudokuModel: sudokuModel)
                    }
                }
            }
            
            Button("Solve Sudoku") {
                sudokuModel.solveWithBacktracking() // Jalankan algoritma backtracking
            }
            .padding()
            
        }
        .padding()
    }
}

struct SudokuBoardTextField: View {
    var row: Int
    var col: Int
    @ObservedObject var sudokuModel: SudokuModel
    
    var body: some View {
        TextField("", text: $sudokuModel.grid[row][col])
            .frame(width: 35, height: 35)
            .multilineTextAlignment(.center)
            .keyboardType(.numberPad)
            .background(sudokuModel.cellColors[row][col])
            .border(Color.black, width: 1)
            .animation(.easeInOut(duration: 0.2), value: sudokuModel.cellColors[row][col])
            .onChange(of: sudokuModel.grid[row][col]) { newValue in
                print("Value changed to \(newValue) for row \(row), col \(col)")
                if newValue.isEmpty || newValue.count == 1 && "123456789".contains(newValue) {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        let isValid = sudokuModel.isValid(sudokuModel.grid, row: row, col: col, num: newValue)
                        sudokuModel.updateCellColor(row: row, col: col, isValid: isValid)
                    }
                } else {
                    sudokuModel.updateCellColor(row: row, col: col, isValid: false)
                }
            }
    }
}

#Preview {
    ContentView()
}


//get: {
//    print("Hey get")
//    return sudokuModel.grid[row][col]
//},
//set: { newValue in
//    print("Hey set")
//    if newValue.isEmpty || newValue.count == 1 && "123456789".contains(newValue) {
//        
//        sudokuModel.grid[row][col] = newValue
//        let isValid = sudokuModel.isValid(sudokuModel.grid, row: row, col: col, num: newValue)
//        print(isValid)
//        sudokuModel.updateCellColor(row: row, col: col, isValid: isValid)
//    } else {
//        print("Invalid input: \(newValue)")  // This will show up if input is not valid
//    }
//}
