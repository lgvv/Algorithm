//
//  boost1.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/06/27.
//

import Foundation

struct boost1 {
    static func run() {
//        print(boost1.solution("뉴뉴")) // 2
        print(boost1.solution("부슈트캠프")) // 2
//        print(boost1.solution("뉴$솔레어")) // 2
    }
    
    static func solution(_ word: String) -> [Int] {
        let keyboard = [
            ["가", "호", "저", "론", "남", "드", "부", "이", "프", "설"],
            ["알", "크", "청", "울", "키", "초", "트", "을", "베", "주"],
            ["개", "캠", "산", "대", "단", "지", "역", "구", "너", "양"],
            ["라", "로", "권", "교", "마", "쿼", "파", "송", "차", "타"],
            ["코", "불", "레", "뉴", " ", "서", "한", "선", "리", "개"],
            ["터", "강", "봄", "토", "캠", "상", "호", "론", "윤", "설"],
            ["보", "람", "이", "경", "아", "두", "프", "바", "트", "정"],
            ["스", "웨", "어", "쿼", "일", "소", "라", "가", "나", "도"],
            ["판", "자", "비", "우", "사", "거", "왕", "태", "요", "품"],
            ["안", "배", "차", "캐", "민", "광", "재", "봇", "북", "하"]
        ]
        
        var now = (-1,-1)
        var find = [(Int, Int)]()
        var answer = [Int]()
//        var result = [Int]()
        
        word.forEach { target in
            find.removeAll()
            
            for i in 0..<keyboard.count {
                for j in 0..<keyboard[i].count {
                    
                    if "\(target)" == "\(keyboard[i][j])" {
                        print("찾았다 \(target)")
                        
                        if find.isEmpty && now.0 == -1 { // 처음이면
                            now = (i, j)
                        }
                        
                        find.append((i,j))
                    }
                }
            }
            
            print(find)
            
            var value = 10000
            if find.isEmpty {
                answer.append(20)
                now = (-1, -1)
            } else {
                
                var tempNow = (0, 0)
                find.forEach { x, y in
                    let temp = (now.0 + now.1) - (x + y)
                    
                    if temp < value {
                        tempNow = (x, y)
                    }
                }
                
                now = tempNow
                answer.append(value)
            }
            
        }
        
        print(answer)
    
        return []
    }
}
