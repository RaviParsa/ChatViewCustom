//
//  SenderMessageCell.swift
//  ChatViewCustom
//
//  Created by Ravi Parsa on 09/03/18.
//  Copyright © 2018 Ravi Parsa. All rights reserved.
//

import UIKit

class SenderMessageCell: UITableViewCell {

    @IBOutlet weak var senderMessageLabel: UILabel!
    @IBOutlet weak var receiverMessageLabel: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        DispatchQueue.main.async {
            
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
