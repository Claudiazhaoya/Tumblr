//
//  PhotoDetailsViewController.swift
//  Tumblr
//
//  Created by Zhaoya Sun on 11/17/17.
//  Copyright © 2017 CodePath University. All rights reserved.
//

import UIKit
import AlamofireImage
class PhotoDetailsViewController: UIViewController, UIScrollViewDelegate{
    
    var post: NSDictionary!
    @IBOutlet weak var photoView: UIImageView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let photos = post["photos"] as? [NSDictionary] {
            let imageUrlString = photos[0].value(forKeyPath: "original_size.url") as? String
            if let imageUrl = URL(string: imageUrlString!) {
                photoView.af_setImage(withURL: imageUrl)
            }
        }
        self.scrollView.minimumZoomScale = 1.0
        self.scrollView.maximumZoomScale = 3.0
        self.scrollView.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.photoView
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
