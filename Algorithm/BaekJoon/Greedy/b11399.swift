//
//  b11399.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/03/22.
//

//https://www.acmicpc.net/problem/11399
import Foundation


struct b11399 {
    static func run() {
        let _: Int! = Int(readLine()!)! // 1..<1000 정수
        let input2 = readLine()
        
        var waiting = 0
        var sum = 0
        
        let time_list: [Int] = input2!.split(separator: " ")
            .map { Int($0)! }
            .sorted(by: <)
        
        time_list.forEach { time in
            waiting += sum
            sum += time
        }
        
        print(waiting + sum)
    }
}
