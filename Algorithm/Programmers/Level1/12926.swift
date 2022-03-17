//
//  12926.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/03/18.
//

//https://programmers.co.kr/learn/courses/30/lessons/12926
import Foundation

struct p12926 {
    static func run() {
//        print(p12926.solution("AB", 1)) // "BC"
        print(p12926.solution("a B z", 4)) // "e F d"
    }

    static func solution(_ s:String, _ n:Int) -> String {
        let alpha = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
        
        var answer = ""
        for c in s {
            if c == " " {
                answer = "\(answer)\(c)"
                continue
            }
            
            var index = alpha.firstIndex(of: c.uppercased()) ?? 0
            if index + n > 25 {
                index = index + n - 26
            } else {
                index += n
            }
            
            let character = alpha[index]
//            print("\(character) \(c)")
            
            if c.isUppercase { // 대문자
                answer = "\(answer)\(character.uppercased())"
            } else {
                answer = "\(answer)\(character.lowercased())"
            }
        }
        
        return answer
    }
}
