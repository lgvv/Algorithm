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
        print(p92334.solution(id_list, report, k)) // [2,1,1,0]
    }
    static func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
        // 유저ID, 유저가 신고한ID
        var user = [String: [String]]()
        // 정지된ID -> [id: count]
        var ban = [String: Int]()
        
        // 로직
        report.forEach { data in
            let field = data.components(separatedBy: " ") // 문자열 분리
            
            if user[field[0]] == nil { // user의 key값이 nil이라면
                user[field[0]] = [field[1]] // 그냥 배열로 바로 넣어줌
                
                if ban[field[1]] == nil { // ban의 value값이 nil이라면
                    ban[field[1]] = 1
                } else { // ban의 value값이 존재한다면
                    ban[field[1]]! += 1
                }
                
            } else { // user의 key에 대응하면 value값이 존재한다면
                var value = user[field[0]]!
                
                if !value.contains(field[1]) { // value에 새로운 값이 이미 포함되어 있지 않으면 수행
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
        
        let ban_id = ban // 정지당한 아이디만 추려내는 과정
            .filter { $0.value >= k }
            .map { $0.key }
        
//        print(ban_id)
        
//        let sortedUser = user.sorted { $0.key < $1.key }
//        print(sortedUser)
        var count_list = [Int](repeating: 0, count: id_list.count)
        
        user.forEach { data in
            let count = Set(ban_id).intersection(data.value).count // 정지당한 아이디와 user가 신고한 아이디에서 몇개가 겹치는지 찾아서
//            print("\(data.key) \(count)")
            
            if let i = id_list.firstIndex(of: data.key) { // 키 값에 해당하는 인덱스를 id_list에서 찾아서
                count_list[i] = count // 카운트 리스트의 자리에다가 값을 넣기
            }
        }
        
        return count_list
    }
    
}
