//
//  ViewController.swift
//  DisplayWebContent
//
//  Created by Bettina on 2/16/18.
//  Copyright © 2018 Bettina Prophete. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*let url = URL(string: "https://www.stackoverflow.com")
        if let unwrappedURL = url as? URL {
            
            webView.load(URLRequest(url: unwrappedURL))
            //the above is a useful way to display a contact form within oyu r app or just getting some information to the user that's stored on a web page somewhere
            //if you've got some Web content stored within your app and you want to display that on the webView.
           
            webView.loadHTMLString("<h1>Hello there!</h1>", baseURL: nil)
            //baseURL is optional. For if you have any links within your HTML page which are relative links
        }
        */
        
        //checking to see if URL can be created from this string. If URL is valid then we create a request, then we create a task which is a urlSession (a bit like opening a browser window to get website content) then looking for Data, Response, Error (handle error if there's one).
        if  let url = URL(string: "https://www.stackoverflow.com") {
            
            let request = NSMutableURLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request as URLRequest) {
                data, response, error in
                
                if error != nil {
                    print(error)
                } else {
                    if let unwrappedData = data {
                        let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue) // convert data to string. standard enconding for url is utf8. returns specified format and lets NSString know what kind of encoding we want
                        print(dataString)
                        DispatchQueue.main.sync(execute: {
                            //Update UI
                        })
                    }
                }
                
            }
            task.resume()
        }
        
        // let user know info is loading
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

