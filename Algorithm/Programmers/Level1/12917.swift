//
//  12917.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/03/19.
//

// https://programmers.co.kr/learn/courses/30/lessons/12917
import Foundation


struct p12917 {
    static func run() {
        print(p12917.solution("ZbcdWRWWefag")) // gfedcbaZWWWR
        print(p12917.solution("Zbcdefg")) // gfedcbZ
    }

    static func solution(_ s:String) -> String {
        let lo_list = s.split { $0.isUppercase }
        let up_list = s.split { $0.isLowercase }
       
        let lo = lo_list.joined().sorted(by: >)
        let up = up_list.joined().sorted(by: >)
        
        let lo_str = lo.map { "\($0)" }.joined()
        let up_str = up.map { "\($0)" }.joined()
        return "\(lo_str)\(up_str)"
    }
}

