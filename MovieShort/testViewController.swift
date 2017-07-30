////
////  testViewController.swift
////  MovieShort
////
////  Created by Cognitive on 7/6/17.
////  Copyright © 2017 Cognitive. All rights reserved.
////
//
//import UIKit
//
//class testViewController: UIViewController {
//   
//   
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//    @IBAction func buttonAction(_ sender: UIButton) {
//        
////        let YoutubeQuery =  "cut36z2qWRk"
////        let escapedYoutubeQuery = YoutubeQuery.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
////        let appURL = NSURL(string: "youtube://www.youtube.com/results?search_query=\(escapedYoutubeQuery!)")!
////        let webURL = NSURL(string: "https://www.youtube.com/results?search_query=\(escapedYoutubeQuery!)")!
////        let application = UIApplication.shared
////        
////        if application.canOpenURL(appURL as URL) {
////            application.open(appURL as URL)
////        } else {
////            // if Youtube app is not installed, open URL inside Safari
////            application.open(webURL as URL)
////        }
////        
//
//        print("button pressed")
//        let url = URL(string: "App-Prefs:root=WIFI") //for WIFI setting app
//        let app = UIApplication.shared
//        app.openURL(url!)
////        
////        let testURl: NSURL = NSURL(string: "https://www.facebook.com/arun.venkatesh.58")!
////        let testid: NSURL = NSURL(string: "fb://profile/100002897367861")!
////        
////        if(UIApplication.shared.canOpenURL(testid as URL)){
////            UIApplication.shared.canOpenURL(testid as URL)
////        }
////        else{
////            UIApplication.shared.canOpenURL(testURl as URL)
////        }
////               
//        
////        let url = URL(string: "https://www.youtube.com/watch?v=smOp5aK-_h0")
////        if UIApplication.shared.canOpenURL(url!){
////            print("Can open shared application url.")
////            if #available(tvOS 10.0, *) {
////                print("tvOS 10.0 detected")
////                
////                UIApplication.shared.open(url!){res in
////                    print("Result..." + String(res))
////                }
////            } else {
////                // Fallback on earlier versions
////                UIApplication.shared.openURL(url!)
////            }
////        }
////        print("end")
//        
//    }
//
//
//    
//}
