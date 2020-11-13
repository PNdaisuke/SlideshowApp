//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Daisuke Tsuruta on 2020/11/05.
//  Copyright © 2020 daisuke.tsuruta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var nButton: UIButton!
    @IBOutlet weak var bButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    var nowIndex:Int = 0
    
    var timer: Timer!
    
    var imageArray: [UIImage] = [
        UIImage(named: "earth-11015_1280.jpg")!,
        UIImage(named: "saturn-54999_640.jpg")!,
        UIImage(named: "sunrise-1756274_1280.jpg")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imageView.image = imageArray[nowIndex]
        
    }
    
    @IBAction func onTapimage(_ sender: Any) {

            performSegue(withIdentifier: "toNext", sender: nil)
        
        if self.timer != nil {
            
            self.timer.invalidate()
            
            self.timer = nil
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toNext" {
            
            let nextVC = (segue.destination as! NextViewController)
            
            nextVC.image = imageView.image!
            
        }
    }
    
    @IBAction func nextButton(_ sender: Any) {
        if nowIndex == 0 {
            
            nowIndex = 1
            
        } else if nowIndex == 1 {
            
            nowIndex = 2
            
        } else if nowIndex == 2 {
            
            nowIndex = 0
            
        }
        
        imageView.image = imageArray[nowIndex]
        
    }
    @IBAction func backButton(_ sender: Any) {
        if nowIndex == 0 {
            
            nowIndex = 2
            
        } else if nowIndex == 2 {
            
            nowIndex = 1
            
        } else if nowIndex == 1 {
            
            nowIndex = 0
            
        }
        
        imageView.image = imageArray[nowIndex]

    }
    
    @IBAction func slideShowButton(_ sender: Any) {
        
        if (timer == nil) {
            
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
            
            startButton.setTitle("停止", for: .normal)
            
            nButton.isEnabled = false
            
            bButton.isEnabled = false
            
        } else {
            
            timer.invalidate()
            
            timer = nil
            
            startButton.setTitle("再生", for: .normal)
            
            nButton.isEnabled = true
            
            bButton.isEnabled = true
            
        }
        
    }
    
    @objc func changeImage() {
        
        nowIndex += 1
        
        if (nowIndex == imageArray.count) {
            
            nowIndex = 0
            
        }
        
        imageView.image = imageArray[nowIndex]
        
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        
        if (timer == nil) {
            
          timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
            
        }
        
    }
    
}

