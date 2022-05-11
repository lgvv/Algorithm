//
//  Kakao5.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/05/07.
//

import Foundation

struct kakao5{
    static func run() {
        print(kakao5.solution(
            [[1, 2, 3], [4, 5, 6], [7, 8, 9]],
            ["Rotate", "ShiftRow"]
        )) // [[8, 9, 6], [4, 1, 2], [7, 5, 3]]
        
//        print(kakao5.solution(
//            [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12]],
//            ["Rotate", "ShiftRow"]
//        ))
    }
    
    // 정확성 통과
    // 효울성 1,2,4,6 시초
    static func solution(_ rc:[[Int]], _ operations:[String]) -> [[Int]] {
        
        var table = rc
        
        for operation in operations {
            if operation == "Rotate" {
                // 1번 작업
                var tempValue = table[0].last!
                table[0].insert(-1, at: 0)
                //                table[0].removeLast()
                
//                print(table[0])
//                print(tempValue)
                
//                print("")
//                print("1 table \(table)")
                // 2번 작업
                for i in 0..<table.count {
                    
                    if i != table.count - 1 {
//                        print("i is \(i)")
                        let temp = table[i+1].removeLast()
                        table[i+1].append(tempValue)
                        tempValue = temp
                    } else {
//                        print("i is \(i) else last")
//                        print(tempValue)
                    }
                }
                
                table[0].removeLast()
//                print("2 table \(table)")
//                print(tempValue)
                // 3번 작업
//                print(" -- 3번작업 시작점 -- ")
                var temp = table[table.count-1].removeLast()
                table[table.count-1].append(tempValue)
                table[table.count-1].append(temp)
                tempValue = table[table.count-1].removeFirst()
//                print(tempValue)
//                print("3 table \(table)")
                
//                print(" -- 4번작업 시작점 -- ")
                // 4번 작업
                for i in stride(from: table.count - 1, through: 0, by: -1) {
//                    print("i3 is \(i)")
                    if i != 0 {
                        temp = table[i-1][0]
                        table[i-1][0] = tempValue
                        tempValue = temp
                    } else {
                        // do not use
                    }
                }
                
                
            } else { // shiftRow
                table.insert(table.last!, at: 0)
                table.removeLast()
//                table[0] = table.last!
//                table.removeLast()
//                table.append(tempArray)
            }
        }
        
//        print(table)
        return table
    }
}
