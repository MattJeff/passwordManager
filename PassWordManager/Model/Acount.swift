//
//  Acount.swift
//  PassWordManager
//
//  Created by Mathis Higuinen on 11/09/2022.
//

import Foundation
import FirebaseFirestoreSwift

struct Account:Identifiable{
    var id = UUID()
    var date:Date
    var name:String
    var link:String
    var email:String
    var passWord:String
}

struct User:Identifiable{
    
    @DocumentID var id:String?
    var username:String
    var email:String
    var profileImageURL:String
}
