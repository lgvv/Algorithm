//
//  12951.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/03/31.
//
// https://programmers.co.kr/learn/courses/30/lessons/12951
import Foundation

struct p12951 {
    static func run() {
        print(p12951.solution("3people unFollowed me")) // "3people Unfollowed Me"
    }

    static func solution(_ s:String) -> String {
        let s = s.components(separatedBy: " ").map { $0.lowercased() }
        
        var answer = [String]()
        s.forEach { str in
            
            if ((str.first?.isLetter) != nil) {
                var up = str.first!.uppercased()
                let index = str.index(str.startIndex, offsetBy: 1)
                answer.append("\(up)\(str[index...])")
            } else {
                answer.append(str)
            }
            
        }
        
        
        return answer.joined(separator: " ")
    }
}
