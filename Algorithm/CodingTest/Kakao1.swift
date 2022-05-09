//
//  Kakao1.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/05/07.
//

import Foundation

// ~ 2시 20분
struct kakao1 {
    static func run() {
        print(kakao1.solution(["AN", "CF", "MJ", "RT", "NA"], [5, 3, 2, 7, 5])) // TCMA
    }
    
    static func solution(_ survey:[String], _ choices:[Int]) -> String {
        var score: [String: Int] = [
            "R": 0,
            "T": 0,
            "C": 0,
            "F": 0,
            "J": 0,
            "M": 0,
            "A": 0,
            "N": 0
        ]
        
        for i in 0..<choices.count {
            let choice = choices[i]
            
            if choice == 4 { } // 아무도 점수를 얻지 않습니다.
            else if choice <= 3 { // 앞의 글자가 점수를 얻는다.
                let key = String(survey[i].first!)
                score[key]! += (4 - choice)
            } else if choice >= 5 { // 뒤의 글자가 점수를 얻는다.
                let key = String(survey[i].last!)
                score[key]! += choice - 4
            }

        }

        var answer = ""
        
        if score["R"]! < score["T"]! {
            answer += "T"
        } else {
            answer += "R"
        }
        
        if score["C"]! < score["F"]! {
            answer += "F"
        } else {
            answer += "C"
        }
        
        if score["J"]! < score["M"]! {
            answer += "M"
        } else {
            answer += "J"
        }
        
        if score["A"]! < score["N"]! {
            answer += "N"
        } else {
            answer += "A"
        }
        
        return answer
    }
}
