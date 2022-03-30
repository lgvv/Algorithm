//
//  12953.swift
//  Algorithm
//
//  Created by Hamlit Jason on 2022/03/30.
//
//https://programmers.co.kr/learn/courses/30/lessons/12953
import Foundation

struct p12953 {
    static func run() {
        print(p12953.solution([2,6,8,14])) // 168
    }
    
    static func solution(_ arr:[Int]) -> Int {
        // 최소공배수 찾는 알고리즘 하나 마련해서 쭉 돌자
        var prev = arr[0]
        for i in 1..<arr.count {
            prev = lcm(prev, arr[i])
        }
        
        return prev
    }
    
    // 최소공배수
    static func lcm(_ a: Int, _ b: Int) -> Int {
        return (a * b) / gcd(a, b)
    }
    
    // 최대공약수
    static func gcd(_ a: Int, _ b: Int) -> Int {
        var a = a
        var b = b
        var r = 0
        
        while b != 0 {
            r = a % b
            a = b
            b = r
        }
        
        return a
    }
}

