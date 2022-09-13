//
//  Acount.swift
//  PassWordManager
//
//  Created by Mathis Higuinen on 11/09/2022.
//

import Foundation

struct Account:Identifiable{
    var id = UUID()
    var date:Date
    var name:String
    var link:String
    var email:String
    var passWord:String
    var icone:String?
}



