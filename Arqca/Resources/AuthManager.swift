//
//  AuthManager.swift
//  Arqca
//
//  Created by Carlos Cardona on 03/09/20.
//  Copyright © 2020 Carlos Cardona. All rights reserved.
//

import UIKit
import FirebaseAuth


struct AuthManager {
    
    static let shared = AuthManager()
    
    public func loginUser(email: String?, password: String, completion: @escaping ((Bool) -> Void)) {
        
        if let email = email {
            
            Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
                
                guard authResult != nil, error == nil else {
                    print("sign in completion: false")
                    completion(false)
                    return
                }
                completion(true)
            }
        }
        
    }
    
    public func registerUser(email: String?, password: String, complerion: @escaping ((Bool) -> Void)) {
        
        if let email = email {
            
            Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
                
                guard authResult != nil, error == nil else {
                    print("register completio: false")
                    complerion(false)
                    return
                }
                complerion(true)
            }
        }
    }
    
}
