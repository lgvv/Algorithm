//
//  17682.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/03/19.
//

//https://programmers.co.kr/learn/courses/30/lessons/17682
import Foundation


struct p17682 {
    static func run() {
        // (1+2+27) * 2
        print(p17682.solution("1D2S3T*")) // 59
    }

    // 점수 보너스 옵션
    static func solution(_ dartResult:String) -> Int {
        var answer = 0
        let scoreList = dartResult.split { $0.isLetter || $0 == "#" || $0 == "*" }
        let letterList = dartResult.split { $0.isNumber }
        print(scoreList)
        print(letterList)
        var answerList = [Double]()
        
        for (score, letter) in zip(scoreList,letterList) {
//            print(answerList)
            var score: Double = Double(score)!
            
            let bonus = letter.first
            
            if bonus == "D" {
                score = pow(score,2)
            } else if bonus == "T" {
                score = pow(score,3)
            }
            
            if letter.contains("*") {
//                print("✨ \(letter)")
                score = score * 2
                
                if answerList.count >= 1 {
                    var lastScore = answerList.last!
                    lastScore *= 2
                    answerList.removeLast()
                    answerList.append(lastScore)
                }
            } else if letter.contains("#") {
                score = -score
            }
            
            
            
            answerList.append(score)
        }
        
        answerList.forEach {
            answer += Int($0)
        }
        
        return answer
    }
}

