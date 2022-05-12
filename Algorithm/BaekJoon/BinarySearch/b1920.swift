//
//  b1920.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/05/12.
//
//https://www.acmicpc.net/problem/1920
import Foundation

struct b1920 {
    
    static func run() {
        _ = Int(readLine()!)!
        var searchList = [Int]()
        var input = readLine()!.components(separatedBy: " ").map { Int($0)! }
        
        input.forEach { searchList.append($0) }
        
        _ = Int(readLine()!)!
        var numberList = [Int]()
        input = readLine()!.components(separatedBy: " ").map { Int($0)! }
        
        input.forEach { numberList.append($0) }
       
        searchList.sort(by: <)
//        print(searchList) // 기준
//        print(numberList) // 찾아야 하는 기준 숫자
        
        var answer = [Int]()
        numberList.forEach {
            let a = binarySearchForAscending(array: searchList, item: $0)
            if a == -1 {
                answer.append(0)
            } else {
                answer.append(1)
            }
        }
        
        answer.forEach {
            print($0)
        }
        
    }
}
