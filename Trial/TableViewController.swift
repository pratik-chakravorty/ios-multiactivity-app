//
//  TableViewController.swift
//  App1
//
//  Created by user136776 on 2/28/18.
//  Copyright © 2018 user136776. All rights reserved.
//

import UIKit
import Foundation

var myIndex = 0
var movieData : Array<Movie>!
var filteredData: Array<Movie>!
var text: Movie!
var searchControl = false



class TableViewController: UITableViewController,UISearchBarDelegate{
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    //get movie data
    
    let movies: Movies = Movies(fromXMLFile: "simple.xml")
    
   
    var inSearchMode = false
    

    override func viewDidLoad() {
       
        super.viewDidLoad()
        searchBar.showsCancelButton = false
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        
        
        
        self.title = "Show Movies"
        
        movieData = movies.getMovie()
        print("Movie data is \(movieData)")
        
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.done

        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
 
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if inSearchMode {
            return filteredData.count
        }
        return movieData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        if inSearchMode {
            text = filteredData[indexPath.row]
            
        } else {
            text = movieData[indexPath.row]
            
        }
        
        // Configure the cell...
//       var movie = movieData[indexPath.row]
        
        //print("cool data is \(movie.directorName)")
        cell.movieTitle.text = text.movieName
        cell.directorName.text = text.directorName
        cell.myImage.image = UIImage(named: text.image)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath){
        cell.alpha = 0
        let transform = CATransform3DTranslate(CATransform3DIdentity, -250, 30, 0)
        cell.layer.transform = transform
        
        UIView.animate(withDuration: 1) {
            cell.alpha = 1
            cell.layer.transform = CATransform3DIdentity
            
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        animateTable()
    }
    func animateTable() {
        self.tableView.reloadData()
        
        let cells = tableView.visibleCells
        let tableHeight: CGFloat = tableView.bounds.size.height
        
        for i in cells {
            let cell: UITableViewCell = i as UITableViewCell
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
        }
        
        var index = 0
        
        for a in cells {
            let cell: UITableViewCell = a as UITableViewCell
            UIView.animate(withDuration: 1.5, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0);
            }, completion: nil)
            
            index += 1
        }
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        performSegue(withIdentifier: "segue", sender: self)
    }
    
    
  
    
    //searchbar stuffs
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            inSearchMode = false
            searchControl = inSearchMode
            //view.endEditing(true)
            self.tableView.reloadData()
            
            
        } else {
            inSearchMode = true
            searchControl = inSearchMode
            filteredData = movieData.filter{$0.movieName.uppercased().contains(searchText.uppercased())}
            self.tableView.reloadData()
            

        }
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
      
        searchBar.endEditing(true)
        searchBar.showsCancelButton = false
    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
      
        searchBar.showsCancelButton = true
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.endEditing(true)
        searchBar.showsCancelButton = false
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.endEditing(true)
        searchBar.showsCancelButton = false
    }

}




