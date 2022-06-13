//
//  42888.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/06/13.
//
//https://programmers.co.kr/learn/courses/30/lessons/42888?language=swift
import Foundation

struct p42888 {
    
    static func run() {
        print(p42888.solution(["Enter uid1234 Muzi", "Enter uid4567 Prodo","Leave uid1234","Enter uid1234 Prodo","Change uid4567 Ryan"])) //["Prodo님이 들어왔습니다.", "Ryan님이 들어왔습니다.", "Prodo님이 나갔습니다.", "Prodo님이 들어왔습니다."]
    }
    
    static func solution(_ record:[String]) -> [String] {
        
        var nameLog = [String: String]()
        var answer = [String]()
        record.forEach { logs in
            let log = logs.components(separatedBy: " ")
            
            if log[0] == "Enter" {
                nameLog[log[1]] = log[2]
                answer.append("\(log[1]) \(log[0])")
            } else if log[0] == "Leave" {
                answer.append("\(log[1]) \(log[0])")
            } else if log[0] == "Change" {
                nameLog[log[1]] = log[2]
            }
            
        }
        
//        print("nameLog: \(nameLog)")
//        print("answer: \(answer)")
        answer = answer.map { item -> String in
            let element = item.components(separatedBy: " ")
            if element[1] == "Enter" {
                return "\(nameLog[element[0]]!)님이 들어왔습니다."
            } else {
                return "\(nameLog[element[0]]!)님이 나갔습니다."
            }
        }
//        print("answer: \(answer)")
        return answer
    }
}
