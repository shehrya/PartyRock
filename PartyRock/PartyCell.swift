//
//  PartyCell.swift
//  PartyRock
//
//  Created by Shehryar Khan on 11.06.17.
//  Copyright © 2017 Shehryar Khan. All rights reserved.
//

import UIKit

class PartyCell: UITableViewCell {
    
    @IBOutlet weak var VideoPreviewImage: UIImageView!

    @IBOutlet weak var VideoTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    
    func updateUI(partyRock: PartyRock) {
        VideoTitle.text = partyRock.videoTitle
        let url = URL(string: partyRock.imageURL)!
        DispatchQueue.global().async {
            //async is the background thread(task is running in background ) it will never stuk the app.
            do {
            let data = try Data(contentsOf: url)
                DispatchQueue.global().sync {
                    // sync is the main thread( here the use of sync is valid because it will be displaying on UI phase)
                    
                    self.VideoPreviewImage.image = UIImage(data: data)
                }
                
            }
            catch {
            
            
            }
        }
    
    
    
    
    
    }


}
