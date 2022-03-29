//
//  12981.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/03/29.
//

//https://programmers.co.kr/learn/courses/30/lessons/12981
import Foundation

struct p12981 {
    
    static func run() {
//                print(p12981.solution(3, ["tank", "kick", "know", "wheel", "land", "dream", "mother", "robot", "tank"])) // [3,3]
        print(p12981.solution(2, ["hello", "one", "even", "never", "now", "world", "draw"])) // [1,3]
        print(p12981.solution(5, ["hello", "observe", "effect", "take", "either", "recognize", "encourage", "ensure", "establish", "hang", "gather", "refer", "reference", "estimate", "executive"])) // [0,0]
    }
    
    static func solution(_ n:Int, _ words:[String]) -> [Int] {
        // 같은 단어가 2번 이상 포함되어 있는지 체크
        
        var prev: Array<String> = []
        
        for word in words.enumerated() {
            
            if prev.contains(word.element) { // 중복 단어라면
                let person = word.offset % n + 1
                let turn = (word.offset / n) + 1
//                print("\(word.offset / n) || \(word.offset % n)")
                return [person, turn]
            }
            
            let lastWord = prev.last?.last
            
            if lastWord != nil {
                if prev.last?.last != word.element.first { // 끝자리와 앞자리가 같지 않다면
                    let person = word.offset % n + 1
                    let turn = (word.offset / n) + 1
//                    print("\(word.offset / n) || \(word.offset % n)")
                    return [person, turn]
                }
            }
            
            prev.append(word.element)
            
        }
        
        return [0, 0]
    }
}
