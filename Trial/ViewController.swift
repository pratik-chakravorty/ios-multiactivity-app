//
//  ViewController.swift
//  App1
//
//  Created by user136776 on 2/28/18.
//  Copyright © 2018 user136776. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var infoBtn: UIButton!
   
    @IBOutlet weak var ilogoicon: UIImageView!
    
    @IBOutlet weak var rlogoicon: UIImageView!
    @IBOutlet weak var ilabel: UILabel!
    @IBOutlet weak var rlabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Insights"
       
        
        
        if searchControl {
            myImage.image = UIImage(named: filteredData[myIndex].image)
            movieTitle.text = filteredData[myIndex].movieName
            ilogoicon.image=UIImage(named: filteredData[myIndex].ilogo)
            rlogoicon.image=UIImage(named: filteredData[myIndex].rlogo)
            ilabel.text = filteredData[myIndex].rating
            rlabel.text = filteredData[myIndex].rt
        } else {
        myImage.image = UIImage(named: movieData[myIndex].image)
        movieTitle.text = movieData[myIndex].movieName
        ilogoicon.image=UIImage(named: movieData[myIndex].ilogo)
        rlogoicon.image=UIImage(named: movieData[myIndex].rlogo)
        ilabel.text = movieData[myIndex].rating
        rlabel.text = movieData[myIndex].rt
        }
        
        infoBtn.backgroundColor = UIColor.white
        
        infoBtn.layer.cornerRadius = 10
        infoBtn.setTitleColor(UIColor.black, for: .normal)
        
        infoBtn.layer.borderWidth = 2
        infoBtn.layer.borderColor = UIColor.black.cgColor
        
//        infoBtn.layer.shadowColor = UIColor.lightGray.cgColor
//        infoBtn.layer.shadowRadius = 12
//        infoBtn.layer.shadowOpacity = 0.5
//        infoBtn.layer.shadowOffset = CGSize(width: 0, height: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // test the segue
//
//        if segue.identifier == "firstSegue" {
//
//            // get the destination controller
//            let destination = segue.destination as? InfoViewController
//
//            // push the data to it
//            destination?. = self.mData
//        }
//    }
    
    @IBAction func infoAction(_ sender: UIButton) {
        performSegue(withIdentifier: "firstSegue", sender: InfoViewController.self)
    }
    

}

