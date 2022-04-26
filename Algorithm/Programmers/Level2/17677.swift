//
//  p17677.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/04/26.
//
//https://programmers.co.kr/learn/courses/30/lessons/17677
import Foundation

struct p17677 {
    static func run() {
//        print(p17677.solution("FRANCE", "french")) // 16384
//        print(p17677.solution("handshake", "shake hands")) // 65536
//        print(p17677.solution("aa1+aa2", "AAAA12")) // 43690
//        print(p17677.solution("E=M*C^2", "e=m*c^2")) // 65536
//        print(p17677.solution("aa1+aa2", "AA12")) // 32768
//        print(p17677.solution("abc", "abbb")) // 16384
//        print(p17677.solution("aaa", "bbb")) // 65536
        print(p17677.solution("BAAAA", "AAA")) // 32768
    }
    
    // 4:26 ~ 5:35
    static func solution(_ str1:String, _ str2:String) -> Int {
        // 입력형식을 준수하자!! 2글자식 끊는다고 합니다.
        var comparisonArray = Array<String>() // 대조군
        var experimentalArray = Array<String>() // 실험군
        
        for i in 0..<str1.count - 1 {
            let start = str1.index(str1.startIndex, offsetBy: i)
            let end = str1.index(str1.startIndex, offsetBy: i+1)
            
            if str1[start].isLetter && str1[end].isLetter { // 둘다 문자이면
                let extraction = String(str1[start...end]).lowercased()
                comparisonArray.append(extraction)
            }
        }
        
        for i in 0..<str2.count - 1 {
            let start = str2.index(str2.startIndex, offsetBy: i)
            let end = str2.index(str2.startIndex, offsetBy: i+1)
            
            if str2[start].isLetter && str2[end].isLetter { // 둘다 문자이면
                let extraction = String(str2[start...end]).lowercased()
                experimentalArray.append(extraction)
            }
        }
        
//        print(comparisonArray)
//        print(experimentalArray)
        
        var denominator: Double = 0 // 분모
        var intersectionCount: Double = 0 // 겹치는 갯수
        
        var tempArray = experimentalArray //
        for i in 0..<comparisonArray.count {
            if tempArray.contains(comparisonArray[i]) {
                let index = tempArray.firstIndex(of: comparisonArray[i])
                tempArray.remove(at: index!)
//                print(tempArray)
                
                intersectionCount += 1
            }
        }
        
        denominator = Double(experimentalArray.count + comparisonArray.count) - intersectionCount
//        print(intersectionCount)
//        print(denominator)
        
        
        var answer = 0
        if denominator == 0 {
            answer = 65536
        } else {
            if intersectionCount > denominator {
                answer = Int(denominator / intersectionCount * 65536)
            } else {
                answer = Int(intersectionCount / denominator * 65536)
            }
        }
        
        return answer
    }
}

