//
//  42883.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/04/13.
//
//https://programmers.co.kr/learn/courses/30/lessons/42883
import Foundation

struct p42883 {
    static func run() {
//        print(p42883.solution("4177252841", 4)) // 94
        print(p42883.solution("119119", 5)) // 9
    }
    
    static func solution(_ number:String, _ k:Int) -> String {
        
        let map = number.map { "\($0)" }
        var stack = [String]()
        var count = 0
        
        for i in 0..<number.count {
            // 아직 덜 지웠거고, 스택에 값이 들어있으면서, 스택의 마지막 값이 비교하는 수보다 작다면
            while count < k && !stack.isEmpty && stack.last! < map[i] {
                stack.removeLast() // 스택값 지우고
                count += 1 // 지웠다는 의미에서 + 1
            }
            
            if count >= k { // k만큼 지웠다면
                stack.append(contentsOf: map[i...]) // 스택에 수행하지 못하고 남은 값들 다 넣어줌
                break
            } else {
                stack.append(map[i]) // 스택에서 지울 수는 없는데, 지울게 남았다면 스택에 넣기
            }
        }
        
        // prefix를 하는 이유는 스택의 앞부분부터 우리가 원하는 출력 갯수를 맞춰주기 위함이다.
        // 예를 들면, "119119" 의 경우에는 99가 출력되기 때문에 이걸 예방하기 위함이다.
        print(stack.joined())
        return String(stack.joined().prefix(number.count-k))
    }
}

