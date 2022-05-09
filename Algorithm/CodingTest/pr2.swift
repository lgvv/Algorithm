//
//  pr2.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/05/08.
//

import Foundation

struct pr2 {
    static func run() {
        print(pr2.solution(["[403]James", "[404]Azad,Louis,Andy", "[101]Azad,Guard"], 403)) // ["Andy", "Louis", "Guard", "Azad"]
    }
    
    
    static func solution(_ rooms:[String], _ target:Int) -> [String] {
        
        var table: [String: [Int]] = [:]
        
        rooms.forEach { room in
            let infos = room.components(separatedBy: "]")
            
            let strIndex = infos[0].index(infos[0].startIndex, offsetBy: 1)
            let number = Int(infos[0][strIndex...])!
            
            let names = infos[1].components(separatedBy: ",")
//            print("names \(names)")
            for i in 0..<names.count {
                let name = names[i]
                
                if table[name] == nil {
                    table[name] = [number]
                } else {
                    var list = table[name]
                    list?.append(number)
                    table[name] = list
                }
            }
        }
        
//        print("table \(table)")
        
        // 이름, 지정 방의 갯수, 방 사이의 최소거리,
        var priority: [(String, Int, Int)] = []
        table.forEach { key, value in
            
            if !value.contains(target) {
                var distance = 10000
                value.forEach { number in
                    let temp = abs(target - number)
                    if distance > temp {
                        distance = temp
                    }
                }
                let data = (key, value.count, distance)
                
                priority.append(data)
            }
        }
        
//        print(priority)
        
        let sortArray = priority.sorted { first, second -> Bool in
            if first.1 != second.1 {
                return first.1 < second.1
            } else {
                if first.2 != second.2 {
                    return first.2 < second.2
                } else {
                    return first.0 < second.0
                }
            }
            
        }
        
        let answer = sortArray.map { $0.0 }
        
        return answer
    }
}
