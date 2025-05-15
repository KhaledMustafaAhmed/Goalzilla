//
//  UserDefault+Extension.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 15/5/25.
//

import Foundation

extension UserDefaults{
    private enum UserDefaultKeys:String {
        case hasOnBoarded
    }
    
    var hasOnBoarded:Bool{
        set{
            setValue(newValue, forKey: UserDefaultKeys.hasOnBoarded.rawValue)
        }
        
        get{
            bool(forKey: UserDefaultKeys.hasOnBoarded.rawValue)
        }
    }
}
