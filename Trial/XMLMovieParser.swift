//
//  XMLMovieParser.swift
//  App1
//
//  Created by user136776 on 3/1/18.
//  Copyright © 2018 user136776. All rights reserved.
//

import UIKit

class XMLMovieParser: NSObject,XMLParserDelegate {
    
        
        //declare the name property to work with
        var name : String
        init(name:String){self.name=name}
        
        //declare the variables to work with
        var movieName, image,directorName,rating,weburl,ilogo,rlogo,rt,desc: String!
        var passData : Bool=false
        var elemId : Int!
        
        var movie=Movie()
        var movies = [Movie]()
        
        var tags = ["name", "director","image","rating","weburl","ilogo","rlogo","rt","desc"]
        
        func beginParsing(){
            // get the file url
            let fileURL = URL(string: self.name, relativeTo: Bundle.main.bundleURL)
            // make a parser object
            let parser = XMLParser(contentsOf: fileURL!)
            //delegate it and start parsing
            parser?.delegate = self
            parser?.parse()
            
        }
        
        func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
            
            // reset the spy vars
            if tags.contains(elementName){
                
                passData = false
                elemId  = -1
                
            }
            
            //test if </person>
            print(elementName)
            if elementName == "movie"{
                //new person found then add it to movies
                movies.append(Movie(movieName: movieName, directorName:directorName,image:image, rating:rating, weburl:weburl,ilogo:ilogo,rlogo:rlogo,rt:rt,desc:desc))
                
                
            }
            
        }
        
        func parser(_ parser: XMLParser, foundCharacters string: String) {
            
            //if data is to pass then store it in a pVar
            
            if passData{
                
                switch elemId{
                case 0 : movieName = string
                case 1 : directorName = string
                case 2 : image = string
                case 3 : rating = string
                case 4 : weburl = string
                case 5: ilogo = string
                case 6: rlogo = string
                case 7 : rt = string
                case 8 : desc = string
                    
                default: break
                    
                }
            }
        }
        
        func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
            
            //pulled element name then reset the spy variables if one of tags
            if tags.contains(elementName)
            {
                //reset the spy-s
                passData = true
                elemId = tags.index(of: elementName)
            }
            
        }
        
    }
