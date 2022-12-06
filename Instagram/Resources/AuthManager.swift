//
//  AuthManager.swift
//  Instagram
//
//  Created by kamilcal on 4.12.2022.
//

import Foundation
import FirebaseAuth



public class AuthManager {
    
    static let shared = AuthManager()
    
    //    MARK: - Public
    
    public func registerNewUser(username: String,
                                email: String,
                                password: String,
                                completion: @escaping ((Bool) -> Void) ){
        
        
        DatabaseManager.shared.canCreateNewUser(with: email, username: username) { canCreate in
            if canCreate {
                Auth.auth().createUser(withEmail: email, password: password) { result,error in
                    guard error == nil, result != nil else {
                        completion(false)
                        return
                    }
                    //veritabanına eklendi ise
                    DatabaseManager.shared.insertNewUser(with: email, username: username) { inserted in
                        if inserted {
                            completion(true)
                        }
                        else {
                            //veritabanına eklenemedi ise
                            completion(false)
                        }
                    }
                }
            }
            else {
                //kullanıcı adı veya e-posta mevcut değil ise
                completion(false)
            }
        }
    }
    
    public func loginUser(username: String?,
                          email: String?,
                          password: String,
                          completion: @escaping ((Bool) -> Void)) {
        
        if let email = email {
            //email log in
            Auth.auth().signIn(withEmail: email, password: password){authResult, error in
                guard authResult != nil, error == nil else {
                    completion(false)
                    return
                }
                completion(true)
            }
            
        }
        else if let username = username {
            print(username)
        }
    }
    
    public func logOut(complietion: (Bool) -> Void) {
        do {
           try Auth.auth().signOut()
            complietion(true)
            return
        }
        catch {
            print(error)
            complietion(false)
            return
        }
    }
}
