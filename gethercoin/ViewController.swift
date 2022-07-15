//
//  ViewController.swift
//  gethercoin
//
//  Created by Kullanici on 13.07.2022.
//

import UIKit

class ViewController: UIViewController {

    //variables
    var timer = Timer()
    var hidetimer = Timer()
  var increase = 0
    var counter = 0
    var highscore = 0
    var coinarray = [UIImageView()]
    // views
    @IBOutlet weak var timelabel1: UILabel!
    @IBOutlet weak var score1: UILabel!
    @IBOutlet weak var highscorelabel1: UILabel!
    @IBOutlet weak var coin1: UIImageView!
    @IBOutlet weak var coin2: UIImageView!
    @IBOutlet weak var coin3: UIImageView!
    @IBOutlet weak var coin4: UIImageView!
    @IBOutlet weak var coin5: UIImageView!
    @IBOutlet weak var coin6: UIImageView!
    @IBOutlet weak var coin7: UIImageView!
    @IBOutlet weak var coin8: UIImageView!
    @IBOutlet weak var coin9: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counter = 5
        increase = 0
        timelabel1.text = String(counter)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
        hidetimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hidecoin), userInfo: nil, repeats: true)
        
        coin1.isUserInteractionEnabled = true
        coin2.isUserInteractionEnabled = true
        coin3.isUserInteractionEnabled = true
        coin4.isUserInteractionEnabled = true
        coin5.isUserInteractionEnabled = true
        coin6.isUserInteractionEnabled = true
        coin7.isUserInteractionEnabled = true
        coin8.isUserInteractionEnabled = true
        coin9.isUserInteractionEnabled = true
        
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        coin1.addGestureRecognizer(recognizer1)
        coin2.addGestureRecognizer(recognizer2)
        coin3.addGestureRecognizer(recognizer3)
        coin4.addGestureRecognizer(recognizer4)
        coin5.addGestureRecognizer(recognizer5)
        coin6.addGestureRecognizer(recognizer6)
        coin7.addGestureRecognizer(recognizer7)
        coin8.addGestureRecognizer(recognizer8)
        coin9.addGestureRecognizer(recognizer9)
        
        coinarray = [coin1,coin2,coin3,coin4,coin5,coin6,coin7,coin8,coin9]
        hidecoin()
    }
    @objc func hidecoin(){
        for coin in coinarray{
            coin.isHidden = true
        }
        let random = Int(arc4random_uniform(UInt32(coinarray.count - 1)))
        coinarray[random].isHidden = false
    }
    
    
    
    @objc func increaseScore(){
       increase += 1
        score1.text = String("Score : \(increase)")
        
    print("yakaladın.")
    }
    @objc func countdown(){
        counter -= 1
        timelabel1.text = String(counter)
        if counter == 0 {
        print("timer bitti.")
            timer.invalidate()//timerdurur.
            hidetimer.invalidate()
            for coin in coinarray{
                coin.isHidden = true
            }
            if self.increase > self.highscore {
                self.highscore = self.increase
                highscorelabel1.text = "highscore : \(self.highscore)"
                UserDefaults.standard.set(self.highscore, forKey: "High score : ")
            }
            let alert = UIAlertController(title: "Time's Up Bitches", message: "bi daha oynacan mı yarrak?", preferredStyle: .alert)
            
            let okbutton = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            let replaybutton = UIAlertAction("bir daha oyna", style: .default) { UI
            
            }
            alert.addAction(okbutton)
            self.present(alert, animated : true, completion: nil)
            
            
            
        }
        print("timer")
    }
   
}

