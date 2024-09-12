//
//  UserDataService.swift
//  Smack
//
//  Created by Manyuchi, Carrington C on 2024/09/11.
//

import Foundation


class UserDataService {
     
    static let instance = UserDataService()
    
    public  private(set) var id = ""
    public private(set) var avatarColor = ""
    public private(set) var avatarName = ""
    public private(set) var email = ""
    public private(set) var name = ""

    func setUserData(id: String, color: String, avatarName: String, email: String, name: String) {
        self.id = id
        self.avatarColor = color
        self.avatarName = avatarName
        self.email = email
        self.name = name
    }
    
    func setAvatarName(avatarName: String) {
        self.avatarName = avatarName
    }
    
    func returnUIColor(components: String) -> UIColor {
        let scanner = Scanner(string: components)
        let skipped = CharacterSet(charactersIn: "[], ")
        let comma = CharacterSet(charactersIn: ",")
        scanner.charactersToBeSkipped = skipped
        
        var r, g, b, a: NSString?
        
        scanner.scanUpToCharacters(from: comma, into: &r)
        scanner.scanUpToCharacters(from: comma, into: &g)
        scanner.scanUpToCharacters(from: comma, into: &b)
        scanner.scanUpToCharacters(from: comma, into: &a)
        
        let defaultColor = UIColor.lightGray
        
        guard let rUnwarapped = r else { return defaultColor}
        guard let gUnwarapped = g else { return defaultColor}
        guard let bUnwarapped = b else { return defaultColor}
        guard let aUnwarapped = a else { return defaultColor}
        
        let rfloat = CGFloat(rUnwarapped.doubleValue)
        let gfloat = CGFloat(gUnwarapped.doubleValue)
        let bfloat = CGFloat(bUnwarapped.doubleValue)
        let afloat = CGFloat(aUnwarapped.doubleValue)
        
        let newUIColor = UIColor(red: rfloat, green: gfloat, blue: bfloat, alpha: afloat)
        
        return UIColor.red
    }
    
}
