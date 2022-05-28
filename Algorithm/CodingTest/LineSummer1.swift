//
//  LineSummer1.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/05/28.
//

import Foundation

struct LineSummer1 {
    static func run() {
        let logs1 = ["morgan string_compare", "felix string_compare", "morgan reverse", "rohan sort", "andy reverse", "morgan sqrt"]
        let logs2 = ["morgan sort", "felix sort", "morgan sqrt", "morgan sqrt", "rohan reverse", "rohan reverse"]
        let logs3 = ["kate sqrt"]
        
//        print(LineSummer1.solution(logs1)) // ["reverse", "string_compare"]
        print(LineSummer1.solution(logs2)) // ["sort"]
//        print(LineSummer1.solution(logs3)) // ["sqrt"]
    }
    
    static func solution(_ logs:[String]) -> [String] {
        
        var WellKnown = [String: Int]()
        // 같은이름에 같은 문제일 수도 있다.
        var cache = [String: [String]]() // 이름: 문제
        
        logs.forEach { log in
            let info = log.components(separatedBy: " ")
            let name = info[0]
            let problem = info[1]
            
            if cache[name] == nil {
                cache[name] = [problem]
            } else {
                if !cache[name]!.contains(problem) {
                    cache[name]!.append(problem)
                }
            }
        }
        
//        print(cache)
        cache.forEach { name, problems in
            
            problems.forEach { problem in
                if WellKnown[problem] == nil {
                    WellKnown[problem] = 1
                } else {
                    WellKnown[problem]! += 1
                }
            }
            
        }
        
//        print(WellKnown)
        var answerList = [String]()
        
        // 한문제 이상 푼 유저 중 절반 이상이 푼 문제
        answerList = WellKnown
            .filter { $0.value >= 1 } // 한문제 이상
            .filter { Double($0.value) >= Double(cache.count) / 2 }
            .map { $0.key }
        
        answerList.sort(by: <)
//        print(answerList)
        
        return answerList
    }
    
    
}
