//
//  17681.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/03/19.
//

// https://programmers.co.kr/learn/courses/30/lessons/17681
import Foundation

struct p17681 {
    static func run() {
        print(p17681.solution(5, [9, 20, 28, 18, 11], [30, 1, 21, 17, 28])) // ["#####","# # #", "### #", "# ##", "#####"]
        print(p17681.solution(6, [46, 33, 33 ,22, 31, 50], [27 ,56, 19, 14, 14, 10])) // ["######", "### #", "## ##", " #### ", " #####", "### # "]
    }
    
    static func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
        var answer: [String] = []
        
        for i in 0..<n {
            let binary1: String = String(arr1[i], radix: 2)
            let binary2: String = String(arr2[i], radix: 2)
            let combinebits = arr1[i] | arr2[i]
            let binary3: String = String(combinebits, radix: 2)
            
//            print("\(binary1) \(binary2) || \(combinebits) || \(binary3)")
            
            var cherry = binary3.map { bit -> String in
                if bit == "1" {
                    return "#"
                } else {
                    return " "
                }
            }
            
            while(cherry.count < n) {
                cherry.insert(" ", at: 0)
            }
            
//            print(cherry)
            answer.append(cherry.joined())
        }
        
        
        return answer
    }
}

