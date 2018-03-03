//
//  WebViewController.swift
//  App1
//
//  Created by user136776 on 3/1/18.
//  Copyright © 2018 user136776. All rights reserved.
//

import UIKit
import WebKit
var url: URL!
class WebViewController: UIViewController,WKNavigationDelegate,WKUIDelegate{

    
    @IBOutlet weak var myWeb: WKWebView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Web Info"
        myWeb.navigationDelegate = self
        myWeb.uiDelegate = self
        
        if searchControl {
             url = URL(string: filteredData[myIndex].weburl)
        }
        else{
         url = URL(string: movieData[myIndex].weburl)
        }
        activityIndicator.hidesWhenStopped = true
        activityIndicator.center = self.view.center
        
        let urlRequest = URLRequest(url: url!)
        myWeb.load(urlRequest)
        
//        let request = NSURL(string: movieData[myIndex].weburl)
//        let requestURL:NSURLRequest = NSURLRequest(URL:request!)
    
       
    }
    
    func showActivityIndicator(show: Bool) {
        if show {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        showActivityIndicator(show: false)
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        showActivityIndicator(show: true)
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        showActivityIndicator(show: false)
    }
    
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
