//
//  42746.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/03/28.
//

//https://programmers.co.kr/learn/courses/30/lessons/42746
import Foundation

struct p42746 {
    
    static func run() {
//        print(p42746.solution([6, 10, 2])) // 6210
//        print(p42746.solution([3, 30, 34, 5, 9])) // 9534330
        print(p42746.solution([0, 0, 0])) // 0
    }
    
    static func solution(_ numbers:[Int]) -> String {
        // 차례로 앞 두개를 순서를 바꾸어서 이어 붙여보기
        var answer = ""
        
        let list = numbers.sorted { Int("\($0)\($1)")! >  Int("\($1)\($0)")!}
        answer = list.map { "\($0)" }.joined()
        if answer.first == "0" { answer = "0" }
        return answer
    }
}
