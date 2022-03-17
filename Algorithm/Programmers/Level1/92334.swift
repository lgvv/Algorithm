//
//  92334.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/03/17.
//

// https://programmers.co.kr/learn/courses/30/lessons/92334
import Foundation

let id_list = ["muzi", "frodo", "apeach", "neo"]
let report = ["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"]
let k = 2

struct p92334 {
    static func run() {
        print(p92334.solution(id_list, report, k))
    }
    static func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
        // 유저ID, 유저가 신고한ID
        var user = [String: [String]]()
        // 정지된ID -> [id: count]
        var ban = [String: Int]()
        
        // 로직
        report.forEach { data in
            let field = data.components(separatedBy: " ")
            
            if user[field[0]] == nil {
                user[field[0]] = [field[1]]
                
                if ban[field[1]] == nil {
                    ban[field[1]] = 1
                } else {
                    ban[field[1]]! += 1
                }
                
            } else {
                var value = user[field[0]]!
                
                if !value.contains(field[1]) {
                    value.append(field[1])
                    user[field[0]] = value
                    
                    if ban[field[1]] == nil {
                        ban[field[1]] = 1
                    } else {
                        ban[field[1]]! += 1
                    }
                }
            }
//            print(user)
        }
//        print(ban)
        
        var ban_id = ban
            .filter { $0.value >= k }
            .map { $0.key }
        
//        print(ban_id)
        
//        let sortedUser = user.sorted { $0.key < $1.key }
//        print(sortedUser)
        var count_list = [Int](repeating: 0, count: id_list.count)
        
        user.forEach { data in
            var count = Set(ban_id).intersection(data.value).count
//            print("\(data.key) \(count)")
            
            if let i = id_list.firstIndex(of: data.key) {
                count_list[i] = count
            }
        }
        
        return count_list
    }
    
}
