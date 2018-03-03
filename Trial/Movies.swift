//
//  Movies.swift
//  App1
//
//  Created by user136776 on 2/28/18.
//  Copyright © 2018 user136776. All rights reserved.
//

import Foundation

class Movies {
    var data : Array<Movie>!
    
    
    init(fromXMLFile: String) {
        // need a parser
        let parser = XMLMovieParser(name:fromXMLFile)
        //begin parsing
        parser.beginParsing()
        //get the data
        self.data = parser.movies
        
        
    }
    
    init() {
        data = [
            Movie(movieName:"Dark Knight",directorName:"CN",image:"none.jpg",rating:"none",weburl:"n",ilogo:"i",rlogo:"r",rt:"rotten",desc:"d")
        ]
    }
    
    // some get methods
    func getCount() -> Int {
        return data.count
    }
    
    func getMovie(_ id : Int) -> Movie {
        return data[id]
    }
    
    func getMovie() -> Array<Movie> {
        print(data)
        return data
    }
}
