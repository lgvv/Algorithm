//
//  Kakao3.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/05/07.
//

import Foundation

struct kakao3 {
    static func run() {
        // problems parmeter
        // 필요한 알고력 , 필요한 코딩력, 증가하는 알고력, 증가하는 코딩력, 푸는데 걸리는 시간
        print(kakao3.solution(10, 10, [[10,15,2,1,2],[20,20,3,3,4]])) // 15
        print(kakao3.solution(0, 0, [[0,0,2,1,2],[4,5,3,1,2],[4,11,4,0,2],[10,4,0,4,2]])) // 13
    }
    
    static func solution(_ alp:Int, _ cop:Int, _ problems:[[Int]]) -> Int {
        
        // 내 능력치
        var myAlp = alp
        var myCop = cop
        
        // 이 두개를 모두 넘어야 문제를 다 풀 수 있는 것이라서 종료 조건에 해당된다.
        var maxAlp = 0
        var maxCop = 0
        
        var minAlp = 300
        var minCop = 300
        
        // 기본 세팅 하나 풀때, 무조건 둘 중 하나 1증가
        var solves: [[Int]] = [
            [0,0,1,0,1],
            [0,0,0,1,1]
        ]
        
        var remains = [[Int]]()
        
        problems.forEach { problem in
            if myAlp >= problem[0] && myCop >= problem[1] {
                solves.append(problem)
            } else {
                remains.append(problem)
            }
            
            if maxAlp < problem[0] { maxAlp = problem[0] }
            if maxCop < problem[1] { maxCop = problem[1] }
        }
        
        //
        var cost = 0
        
        var count = 0
        while count < 30 {
            count += 1
            
            remains.forEach { remain in
                if minAlp > remain[0] { minAlp = remain[0] }
                if minCop > remain[1] { minCop = remain[1] }
            }
            
            let alpForDircet = myAlp - minAlp
            let copForDircet = myCop - minCop
            
            var selectMax: [Int] = [0,0,0,0,0]
            if alpForDircet - copForDircet > 0 { // alp가 더 크면 cop가 더 적게 남았음
                solves.forEach { solve in
                    if selectMax[3] < solve[3] { selectMax = solve }
                }
                
                myAlp += selectMax[2]
                myCop += selectMax[3]
                cost += selectMax[4]
                
                if myAlp >= selectMax[2] && myCop >= selectMax[3] {
                    solves.append(selectMax)
                }
            }
        }
        
        print("solve \(solves)")
        print("remiain \(remains)")
        print("maxAlp \(maxAlp) maxCop \(maxCop)")
        print("minAlp \(minAlp) minCop \(minCop)")
        
        return 0
    }
}
