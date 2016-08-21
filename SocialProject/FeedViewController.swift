//
//  FeedViewController.swift
//  SocialProject
//
//  Created by Mark Wong on 8/21/16.
//  Copyright © 2016 Mark Wong. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper
import Firebase


class FeedViewController: UIViewController {
    
    @IBAction func signOut(sender: AnyObject) {
        
        let keychainResult = KeychainWrapper.defaultKeychainWrapper().removeObjectForKey(KEY_UID)
        print("ID removed from keychain \(keychainResult)")
        try! FIRAuth.auth()?.signOut()
        performSegueWithIdentifier("goToSignIn", sender: nil)
   
        
    }
    
    
    
    

}
