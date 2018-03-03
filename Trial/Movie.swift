//
//  Movie.swift
//  App1
//
//  Created by user136776 on 2/28/18.
//  Copyright © 2018 user136776. All rights reserved.
//

import Foundation

class Movie {
    var movieName: String
    var directorName: String
    var image: String
    var rating: String
    var weburl  : String
    var ilogo : String
    var rlogo: String
    var rt : String
    var desc : String
    
    // init functions
    init() {
        self.movieName = "Dark Knight"
        self.directorName = "N/A"
        self.image = "None.jpg"
        self.rating = "NA"
        self.weburl = "na"
        self.ilogo = "r"
        self.rlogo = "n"
        self.rt = "r"
        self.desc = "d"
    }
    
    init(movieName:String,directorName:String,image:String,rating:String,weburl:String,ilogo:String,rlogo:String,rt:String,desc:String) {
        self.movieName = movieName
        self.directorName = directorName
        self.image = image
        self.rating = rating
        self.weburl = weburl
        self.ilogo = ilogo
        self.rlogo = rlogo
        self.rt = rt
        self.desc = desc
    }
    
    
}
