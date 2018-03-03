//
//  TableViewCell.swift
//  App1
//
//  Created by user136776 on 2/28/18.
//  Copyright © 2018 user136776. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

  
    @IBOutlet weak var myImage: UIImageView!
    
    @IBOutlet weak var movieTitle: UILabel!
    
    @IBOutlet weak var directorName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        myImage.layer.cornerRadius = myImage.frame.width/2
        myImage.clipsToBounds = true
        myImage.layer.borderWidth = 2
    
    }
    
   

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
