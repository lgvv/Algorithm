//
//  84512.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/03/30.
//
//https://programmers.co.kr/learn/courses/30/lessons/84512
import Foundation

struct p84512 {
    static func run() {
//        print(p84512.solution("AAAAE")) // 6
        print(p84512.solution("EIO")) // 1189
//        print(p84512.solution("I")) // 1563
    }
    
    static func solution(_ word:String) -> Int {
        let vowel = ["A", "E", "I", "O", "U"]
        let value = [781, 156, 31, 6, 1]
        var sum = 0
        
        for item in word.enumerated() {
            let index = vowel.firstIndex(of: "\(item.element)").map { Int($0) }
            let count = (index! * value[item.offset]) + 1
            sum += count
        }
//        print(sum)
        return sum
    }
}
