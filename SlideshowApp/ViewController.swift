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
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func onTapimage(_ sender: Any) {
        
        performSegue(withIdentifier: "toNext", sender: nil)
        
    }
    
    var nowIndex:Int = 0
    
    var timer: Timer!
    
    var imageArray: [UIImage] = [
        UIImage(named: "earth-11015_1280")!,
        UIImage(named: "saturn-54999_640")!,
        UIImage(named: "sunrise-1756274_1280")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
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
        if nowIndex == 2 {
            
            nowIndex = 0
            
        } else if nowIndex == 0 {
            
            nowIndex = 1
            
        } else if nowIndex == 1 {
            
            nowIndex = 2
            
        }
        
        imageView.image = imageArray[nowIndex]

    }
    
    @IBAction func slideShowButton(_ sender: Any) {
        
        if (timer == nil) {
            
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
            
            startButton.setTitle("停止", for: .normal)
            
        } else {
            
            timer.invalidate()
            
            timer = nil
            
            startButton.setTitle("再生", for: .normal)
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
        
    }
    
    
    
}

