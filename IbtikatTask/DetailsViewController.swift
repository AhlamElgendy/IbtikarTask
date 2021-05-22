//
//  DetailsViewController.swift
//  IbtikatTask
//
//  Created by Ahlam on 21/5/2021.
//

import UIKit

class DetailsViewController: UIViewController {

    
    // MARK: - outlets
    @IBOutlet weak var detailedImg:UIImageView!
    @IBOutlet weak var detailedLbl:UILabel!

    // MARK: - helper variables
    var media:Media?
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.detailedImg.kf.setImage(with: URL(string: media?.coverAsset?.url ?? ""))
        self.detailedLbl.text = media?.title

    }
    

   
    
    // MARK: - helper methods
    
    // MARK: - actions
    @IBAction func closeBtnPressed(_sender:UIButton){
        self.dismiss(animated: true, completion: nil)
    }
    

}
