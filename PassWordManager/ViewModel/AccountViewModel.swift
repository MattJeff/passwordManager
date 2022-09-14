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
    @Published var passWord:String=""
    @Published var AppName:String=""
    @Published var AppLink:String=""
    @Published var Email:String=""
    @Published var icon:String?
    
    @Published var isSubmit = false
    
    func passWordIsValide()->CreationError{
        
        var  valeur:CreationError = .noError
        if isSubmit && self.passWord.isEmpty {
            
            valeur = .passwordError
        }
    return valeur }
    
    func AppNameIsValide()->CreationError{
        var  valeur:CreationError = .noError
        if isSubmit && self.AppName.isEmpty {
            
            valeur = .NameError
        }
    return valeur
    }
    
    
    func EmailIsValide()->CreationError{
        
        var  valeur:CreationError = .noError
        
        if self.isSubmit && self.Email.isEmpty {
   
            
            valeur = .emailError
            
            
        }
        
    return valeur
        
    }
    
    func AppLinkIsValid()->CreationError{
        
        var  valeur:CreationError = .noError
        
        if isSubmit && self.AppLink.isEmpty {
            
            valeur = .linkError
        }
    return valeur
    }
    
    
    func addAcount()->Bool{
    
        self.isSubmit = true
        var isAdd = false
        let Email = EmailIsValide()
        let Name = AppNameIsValide()
        let Link = AppLinkIsValid()
        let PassWord = passWordIsValide()
        
        print("----------------------")
        print(Email)
        print(Name)
        print(Link)
        print(PassWord)
        print("----------------------")
        

            guard Email != .emailError else {  return false }
            guard Name != .NameError else {   return false }
            guard Link != .linkError else {    return  false }
            guard PassWord != .passwordError   else {  return false }
        

        
        let account = Account(date: Date(), name: self.AppName, link: self.AppLink, email: self.Email, passWord: self.passWord)
        
        isAdd = true
        
        self.accounts.append(account)
        
        self.isSubmit = false 

    return isAdd}
    
    
    func UpdateAccount(){
        
    }
    
    func deleteAccount(){
        
    }
    
    
    
    func generatePassword(_ length:Int,_ widthsymbole:Bool){
        
        var base = Array("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPKRSTUVWXYZ1234567890")
        let symbole = "$*€()!?:/+=&@"
        
        if widthsymbole {
            base += symbole
        }
        
        let rndPswd = String((0..<length).map{ _ in base[Int(arc4random_uniform(UInt32(base.count)))]})
        
        self.passWord = rndPswd
        
    }
    
}
