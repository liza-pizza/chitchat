//
//  StringExtensions.swift
//  chitchat
//
//  Created by Liza Bipin on 21/08/21.
//

import Foundation
import TweenKit

let alphabetString = "abcdefghijklmnopqrstuvwxyz"

func convertCharacterToInt(_ character: Character) -> Int {
    
    for (index, char) in alphabetString.enumerated() {
        if char == character {
            return index
        }
    }
    
    fatalError("Unable to convert character to int: \(character)")
}

func convertIntToCharacter(_ int: Int) -> Character {
    
    for (index, char) in alphabetString.enumerated() {
        if index == int {
            return char
        }
    }
    
    fatalError("Unable to convert int to character: \(int)")
}

extension Int: Tweenable {
    
    public func lerp(t: Double, end: Int) -> Int {
        print("t = \(t)")
        let intT = Int(t)
        return self + ((end - self) * intT)
    }
    
    public func distanceTo(other: Int) -> Double {
        fatalError("Not implemented")
    }
    
}


extension String: Tweenable {
    
    public func lerp(t: Double, end: String) -> String {
        
        precondition(self.count == end.count)
        
        if t < 0.00001 {
            return self
        }
        if t > 1 - 0.0005 {
            return end
        }
        
        let fromNumber = self.asNumber()
        let toNumber = end.asNumber()
        
        let interpolated = Double(fromNumber).lerp(t: t, end: Double(toNumber))
        return String(number: Int(interpolated), length: self.count)
    }
    
    init(number: Int, length: Int) {
        
        var characters = [Character]()
        
        for index in (0..<length) {
            
            if index == length-1 {
                let charNum = number % 26
                characters.append( convertIntToCharacter(charNum) )
            }
            else{

                let distanceFromEnd = length - index - 1
                var num = number
                (0..<distanceFromEnd).forEach{ _ in
                    num /= 26
                }
                num -= 1
                num = num % 26
                characters.append( convertIntToCharacter(num) )
            }
        }
        
        self.init(characters)
    }
    
    func asNumber() -> Int {
        
        var cumulative = 0
        
        for (index, char) in self.reversed().enumerated() {
         
            var num = convertCharacterToInt(char)
            
            if index == 0 {
                cumulative += num
            }
            else{
                num += 1
                (0..<index).forEach{ _ in
                    num *= 26
                }
                cumulative += num

            }
        }
        return cumulative
    }
   

    public func distanceTo(other: String) -> Double {
        fatalError("Not implemented")
    }
}
