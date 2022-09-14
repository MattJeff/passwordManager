//
//  AccountViewModel.swift
//  PassWordManager
//
//  Created by s864226 on 13/09/2022.
//

import SwiftUI
import Security

class AccountManager:ObservableObject{
    
    @Published var accounts:[Account] = []
    
    func addAcount(AppName:String,AppLink:String,Email:String,PassWord:String,icon:String?){
        
        let account = Account(date: Date(), name: AppName, link: AppLink, email: Email, passWord: PassWord)
        
        self.accounts.append(account)
    }
    
    func UpdateAccount(){
        
    }
    
    func deleteAccount(){
        
    }
    
    
    func generatePassword(_ length:Int,_ widthsymbole:Bool)->String{
        
        var base = Array("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPKRSTUVWXYZ1234567890")
        let symbole = "$*€()!?:/+=&@"
        
        if widthsymbole {
            base += symbole
        }
        
        let rndPswd = String((0..<length).map{ _ in base[Int(arc4random_uniform(UInt32(base.count)))]})
        
        return rndPswd
        
    }
    
}
