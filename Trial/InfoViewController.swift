//
//  InfoViewController.swift
//  App1
//
//  Created by user136776 on 3/1/18.
//  Copyright © 2018 user136776. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var movieLabel: UILabel!

    @IBOutlet weak var content: UITextView!
    
    @IBOutlet weak var webBtn: UIButton!
    //var mData : Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        content.isEditable = false
        self.title = "Info"

        // Do any additional setup after loading the view.
        if searchControl {
        movieLabel.text = filteredData[myIndex].movieName
        content.text = filteredData[myIndex].desc
        movieLabel.font = UIFont.boldSystemFont(ofSize: 50)
        }
        else{
            movieLabel.text = movieData[myIndex].movieName
            content.text = movieData[myIndex].desc
            movieLabel.font = UIFont.boldSystemFont(ofSize: 50)
        }
        
        content.layer.borderWidth = 2
        content.backgroundColor = UIColor.white
        content.layer.cornerRadius = 10
        
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 20
        let attributes = [NSAttributedStringKey.paragraphStyle : style]
        content.attributedText = NSAttributedString(string: content.text, attributes: attributes)
        content.font = UIFont.systemFont(ofSize: 18)
        
        webBtn.backgroundColor = UIColor.white
        
        webBtn.layer.cornerRadius = 10
        
        webBtn.setTitleColor(UIColor.black, for: .normal)
        
        webBtn.layer.borderWidth = 2
        webBtn.layer.borderColor = UIColor.black.cgColor
        
        
//        webBtn.layer.shadowColor = UIColor.lightGray.cgColor
//        webBtn.layer.shadowRadius = 12
//        webBtn.layer.shadowOpacity = 0.5
//        webBtn.layer.shadowOffset = CGSize(width: 0, height: 0)
        
   
        
        
    }
    
  
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func webBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "webSegue", sender: self)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
  

}


