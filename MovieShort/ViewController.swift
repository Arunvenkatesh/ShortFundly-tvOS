//
//  ViewController.swift
//  Clip_Try
//
//  Created by Cognitive on 6/14/17.
//  Copyright © 2017 Cognitive. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let backgroundImages = ["c1","c2","c3","c4","c5"]
    let quotes = ["Welcome to Shortfundly","Get Connected with filmmakers","Get notification from filmfestival events","Launch crowdfunding campaigns","Build unique filmmakers profile"]
    let descQuotes = ["Watch shortfilms & find filmfestival events in one place","Meet filmmakers & follow shortfilms celebirities","Register to get filmfestival updates","Raise funds for your creative shortfilms using crowdfunding techniques","Showcase your filmmaking talents in your profile"]

    
    
    
    
    @IBOutlet weak var iv: UIImageView!
    
    var minIndex = 0
    var maxIndex = 4
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    @IBOutlet weak var startButtonOutlet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        startButtonOutlet.isHidden = true
      
        
        let leftSwipe =  UISwipeGestureRecognizer(target: self, action: #selector(handleSwipesLeft))
        let rightSwipe =  UISwipeGestureRecognizer(target: self, action: #selector(handleSwipesRight))
        leftSwipe.direction = .left
        rightSwipe.direction = .right
        
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
      
        
        iv.image = UIImage(named: backgroundImages[minIndex])
        welcomeLabel.text = quotes[minIndex]
        descriptionLabel.text = descQuotes[minIndex]
        
        
    }
    func handleSwipesLeft(sender: UISwipeGestureRecognizer)
    {
        if sender.direction == .left
        {
            if minIndex != 4
            {
            minIndex = minIndex + 1
            
            
            if minIndex > maxIndex {
                
                minIndex = 0
                
            }
            
            }
            
            if minIndex == 4
            {
                startButtonOutlet.isHidden = false
            }
            else
            {
                startButtonOutlet.isHidden = true
            }
    
            iv.image = UIImage(named: backgroundImages[minIndex])
            welcomeLabel.text = quotes[minIndex]
            descriptionLabel.text = descQuotes[minIndex]
            
        }
    }
    
    func handleSwipesRight(sender: UISwipeGestureRecognizer)
    {
        if sender.direction == .right
        {
            
            if minIndex != 0
            {
            minIndex -= 1
            
            if minIndex < 0 {
                
                minIndex = maxIndex
                
            }
        
                if minIndex == 4
                {
                    startButtonOutlet.isHidden = false
                }
                else
                {
                    startButtonOutlet.isHidden = true
                }
                
                iv.image = UIImage(named: backgroundImages[minIndex])
                welcomeLabel.text = quotes[minIndex]
                

            iv.image = UIImage(named: backgroundImages[minIndex])
                welcomeLabel.text = quotes[minIndex]
                descriptionLabel.text = descQuotes[minIndex]

                
            
        }
        }
        }

}
