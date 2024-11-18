//
//  ViewController.swift
//  PushNotification
//
//  Created by Priya Hansaliya on 09/08/24.
//

import UIKit
import GoogleSignIn
import FirebaseAuth
import AuthenticationServices

class detailModel : NSObject {
    
    //var id : String = ""
    var name : String = ""
    var email : String = ""
    var image : String = ""
    
    init(fromDictionary dictionary: [String:Any]){
        //id = dictionary["handle"] as! String
        name = dictionary["name"] as! String
        email = dictionary["email"] as! String
        image = dictionary["avatar"] as! String
    }
}


class ViewController: UIViewController {
    
    
    //MARK: - Outlets
    
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    
    //MARK: - Global Variables
    var dictGoogledetail : detailModel?
    var dictRegister =  [String : Any]()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false

    }
    
    //MARK: - IBActions
    
    @IBAction func btnEmail_Action(_ sender: Any) {
        let email = tfEmail.text
        if email != "" && tfPassword.text != "" {
            if !(email?.isValidEmail ?? false) {
                
            }
        }
    }
    
    @IBAction func btnPhoneNumber_Action(_ sender: Any) {
    }
    @IBAction func btnGoogle_Action(_ sender: Any) {
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { signInResult, error in
            guard error == nil else { return }
            
            guard let signInResult = signInResult else {
                self.gIDSignInDidSignIn(for: nil)
                return
            }
            
            self.gIDSignInDidSignIn(for: signInResult.user)
            
        }
    }
    @IBAction func btnFaceBook_Action(_ sender: Any) {}
//    {
//        let temp = LoginManager()
//        temp.logOut()
//        
//        temp.logIn(permissions: ["public_profile", "email"], from: self, handler: { (result, error) in
//            if let error = error {
////                self.showAlertWithOkButton(alertText: SLanguageLocalisation.message, alertMessage: error.localizedDescription)
//            } else if result?.isCancelled ?? false {
//                
//                // Handle cancellation
//            } else {
////                self.view.showNVActivityIndicatorView()
//                if AccessToken.current != nil {
//                    GraphRequest(graphPath: "me", parameters: ["fields": "picture.type(large), email, last_name, first_name"]).start(completion: { (connection, result, error) in
////                        self.view.showNVActivityIndicatorView()
//                        if let result = result as? [String: Any], error == nil {
//                            var dictRegister = [String: Any]()
//                            dictRegister["handle"] = result["id"] as? String ?? ""
//                            dictRegister["name"] = result["first_name"] as? String ?? ""
//                            dictRegister["Lastname"] = result["last_name"] as? String ?? ""
//                            dictRegister["email"] = result["email"] as? String ?? ""
//                            
//                            var profileURL = ""
//                            if let pictureData = (result["picture"] as? [String: Any])?["data"] as? [String: Any], let url = pictureData["url"] as? String {
//                                profileURL = url
//                            }
//                            
//                            profileURL = profileURL.replacingOccurrences(of: "&", with: "%26")
//                            dictRegister["avatar"] = profileURL
//                            dictRegister["registerType"] = "FB"
////                            self.registerUser(dictRegister)
//                        } else {
////                            self.showAlertWithOkButton(alertText: SLanguageLocalisation.message, alertMessage: error?.localizedDescription ?? "")
//                        }
//                    })
//                }
//            }
//        })
//    }
    @IBAction func btnInstagram_Action(_ sender: Any) {
    }
    
    @IBAction func btnApple_Action(_ sender: Any) {
        let provider = ASAuthorizationAppleIDProvider()
        let request = provider.createRequest()
        request.requestedScopes = [.fullName, .email]
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.presentationContextProvider = self
        controller.performRequests()
    }
    
    @IBAction func Chat_Action(_ sender: Any) {
        let dVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ChatVC")
        self.navigationController?.pushViewController(dVC, animated: true)
    }
    
    //MARK: - Method Function
    func gIDSignInDidSignIn(for user: GIDGoogleUser?) {
        //        guard let idToken = user?.idToken else {
        //            return
        //        }
        guard let idToken = user?.idToken, let accessToken = user?.accessToken else {
            // Handle the case where either 'idToken' or 'accessToken' is nil
            return // Or perform appropriate error handling
        }
        
        let credential = GoogleAuthProvider.credential(withIDToken: idToken.tokenString, accessToken: accessToken.tokenString)
        FirebaseAuth.Auth.auth().signIn(with: credential, completion: { authResult, error in
            guard authResult != nil, error == nil else {
                print("failed to log in with google credential")
                return
            }
            
            print("Successfully signed in with Google cred.")
        })
        
        // Now yo
        if let user = user {
            print(user)
            dictRegister["handle"] = user.userID
            dictRegister["name"] = user.profile?.name
            dictRegister["email"] = user.profile?.email
            let currentEmail = DatabaseManager.safeEmail(emailAddress: user.profile!.email)
            UserDefaults.standard.set(currentEmail, forKey: "email")
            if let hasImage = user.profile?.hasImage, hasImage {
                dictRegister["avatar"] = user.profile?.imageURL(withDimension: 200)?.absoluteString
            }
            dictRegister["registerType"] = "googleplus"
            dictGoogledetail = detailModel(fromDictionary: dictRegister)
//            var userChat = ChatAppUser(firstName: user.profile!.name, lastName: user.profile!.name, emailAddress: user.profile!.name)
//            //DatabaseManager.shared.insertUser(with: chatUser(name: user.profile!.name, email: user.profile!.email))
//            DatabaseManager.shared.insertUser(with: ChatAppUser(firstName: user.profile!.name, lastName: user.profile!.name, emailAddress: user.profile!.email)) { [self] (success: Bool) in // Explicitly specify the type of success
//                if success {
//                    // upload image
//                    
//                    let img: UIImage = .img2 // Specify the type of img
//                    let data = img.pngData()
//                    let filename = "\(user.profile!.email)_profile_picture.png"
//                    StorageManager.shared.uploadProfilePicture(with: data!, fileName: filename, completion: { (result: Result<String, Error>) in // Explicitly specify the type of result
//                        switch result {
//                        case .success(let downloadUrl):
//                            UserDefaults.standard.set(downloadUrl, forKey: "profile_picture_url")
//                            print(downloadUrl)
//                        case .failure(let error):
//                            print("Storage manager error: \(error)")
//                        }
//                    })
//                }
//            }
        } else {
            print("No User Found")
        }
    }
    
    //MARK: - Other Function
 
}


//MARK: - ASAuthorizationControllerDelegate Methods
extension ViewController: ASAuthorizationControllerDelegate {
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            let credentials = appDelegate?.retrieveAppleUserCredentials(appleIDCredential.user)
            if credentials?.keys.count ?? 0 > 0 {
                var registerDict = [String: Any]()
                registerDict["handle"] = credentials?["id"]
                registerDict["name"] = credentials?["fullname"]
                registerDict["email"] = credentials?["email"]
                registerDict["registerType"] = "Apple"
               // self.registerUser(registerDict)
            } else {
                var dict: [String: Any] = ["fullname": "\(appleIDCredential.fullName?.givenName ?? "") \(appleIDCredential.fullName?.familyName ?? "")",
                                           "id": appleIDCredential.user,
                                           "email": appleIDCredential.email ?? ""]
               // appDelegate?.saveAppleUserCredentials(dict)
                var registerDict = [String: Any]()
                registerDict["handle"] = dict["id"]
                registerDict["name"] = dict["fullname"]
                registerDict["email"] = dict["email"]
                registerDict["registerType"] = "Apple"
               // self.registerUser(registerDict)
            }
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        if let error = error as NSError?, error.code != 1001 {
//            self.showAlertWithOkButton(alertText: "", alertMessage: error.localizedDescription)
        }
    }

    
}

extension ViewController: ASAuthorizationControllerPresentationContextProviding {
    
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
    
}
