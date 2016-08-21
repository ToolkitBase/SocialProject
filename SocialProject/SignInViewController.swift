//
//  ViewController.swift
//  SocialProject
//
//  Created by Mark Wong on 8/17/16.
//  Copyright © 2016 Mark Wong. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase
import SwiftKeychainWrapper

class SignInViewController: UIViewController {
    
    @IBOutlet weak var emailField: CustomField!
    
    @IBOutlet weak var pwdField: CustomField!
    
    
    @IBAction func signIn(sender: AnyObject) {
        
        if let email = emailField.text, let pwd = pwdField.text {
            FIRAuth.auth()?.signInWithEmail(email, password: pwd, completion: { (user, error) in
                if error == nil {
                    print("User authenticated with Firebase")
                    if let user = user {
                        self.completeSignIn(user.uid)
                    }
                } else {
                    FIRAuth.auth()?.createUserWithEmail(email, password: pwd, completion: { (user, error) in
                        if error != nil {
                            print("Unable to authenticate with Firebase using email")
                        } else {
                            print("Successfully authenticated with Firebase")
                            if let user = user {
                                self.completeSignIn(user.uid)
                            }
                        }
                    })
                }
            })
        }
        
        
    }
    
    @IBAction func facebookBtnTapped(sender: AnyObject) {
        
        let facebookLogin = FBSDKLoginManager()
        facebookLogin.logInWithReadPermissions(["email"], fromViewController: self) { (result, error) in
            if error != nil {
                print("Unable to authenticate with Facebook - \(error)")
            } else if result?.isCancelled == true {
                print("User cancelled Facebook authentication")
            } else {
                print("Successful authentication with Facebook")
                let credential = FIRFacebookAuthProvider.credentialWithAccessToken(FBSDKAccessToken.currentAccessToken().tokenString)
                self.firebaseAuth(credential)
            }
        }
        
    }
    
    func firebaseAuth(credential: FIRAuthCredential) {
        FIRAuth.auth()?.signInWithCredential(credential, completion: { (user, error) in
            if error != nil {
                print("Unable to authenticate with Firebase - \(error)")
            } else {
                print("Successfully authenticated with Firebase")
                if let user = user {
                    self.completeSignIn(user.uid)
                }
                
            }
        })
    }
    
    func completeSignIn(id: String) {
        
        //let keychainResult =
        KeychainWrapper.defaultKeychainWrapper().setString(id, forKey: KEY_UID)
        performSegueWithIdentifier("goToFeed", sender: nil)
       // print("Data saved to keychain \(keychainResult)")
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
       //view did load cannot load segues.
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        //check if UID in keychain
        
        if let _ = KeychainWrapper.defaultKeychainWrapper().stringForKey(KEY_UID) {
            
            performSegueWithIdentifier("goToFeed", sender: nil)
        
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

