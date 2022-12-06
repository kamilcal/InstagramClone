//
//  DatabaseManager.swift
//  Instagram
//
//  Created by kamilcal on 4.12.2022.
//

import FirebaseDatabase

public class DatabaseManager {
    
    
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    
    //    MARK: - Public
    ///Check if username and mail is avaible
    ///- Parameters
    ///         -email: String representing email
    ///         -username: String representing username
    public func canCreateNewUser(with email: String, username: String, completion: (Bool) -> Void) {
        completion(true)
    }
    
    public func insertNewUser(with email: String, username: String, completion: @escaping ((Bool) -> Void)) {
        database.child(email.safeDatabaseKey()).setValue(["username": username]) { error, _ in
            if error == nil {
                completion(true)
                return
            }
            else {
                completion(false)
                return

            }
        }
    }
    
   
}
