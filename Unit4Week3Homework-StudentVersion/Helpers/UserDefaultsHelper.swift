//
//  UserDefaultsHelper.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/9/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation

class UserDefaultsHelper {
    private init() {}
    static let manager = UserDefaultsHelper()
    
    let nameKey = "10002"
    
    
    
    func saveNewZipCode(ZipCode: String) {
        UserDefaults.standard.set(nameKey, forKey: "SavedZipCode")
    }
    
    func getSavedZipCode() -> String? {
        return UserDefaults.standard.object(forKey: "SavedZipCode") as? String
    }
}
