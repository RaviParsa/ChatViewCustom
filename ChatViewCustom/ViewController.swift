//
//  ViewController.swift
//  ChatViewCustom
//
//  Created by Ravi Parsa on 09/03/18.
//  Copyright © 2018 Ravi Parsa. All rights reserved.
//

//https://stackoverflow.com/questions/30774671/uitableview-with-more-than-one-custom-cells-with-swift

import UIKit

class ViewController: UIViewController , UIImagePickerControllerDelegate, UITextFieldDelegate, UINavigationControllerDelegate, UIScrollViewDelegate
{
    @IBOutlet weak var txtField: UITextField!
   // @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    let imagePicker = UIImagePickerController()
    var senderMessage = NSMutableArray()
    var receiverMessage = NSMutableArray().self
    var sendBool: Bool?
    var GetBool: Bool?
    var sendMessageCellBool: Bool?
    var receiveMessageCellBool: Bool?


    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.tblView.delegate = self
        //self.tblView.dataSource = self
        
        imagePicker.delegate = self as UIImagePickerControllerDelegate & UINavigationControllerDelegate
        txtField.delegate = self
        scrollView.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height + 300)

        sendBool = true
        
       // receiverMessage = [#imageLiteral(resourceName: "camera")]
        //receiverMessage = [#imageLiteral(resourceName: "camera"),#imageLiteral(resourceName: "camera")]
        
        /*
        //Even
        receiverMessage = ["a", "b", "c", "d", "e", "f"]
        for i in 0..<receiverMessage.count {
            if i % 2 == 0 {
                print("sender even ==== \(receiverMessage[i])")
            }
        }
        
        //Odd
        for i in 0..<receiverMessage.count {
            if i % 2 == 1 {
                print("receiver odd ==== \(receiverMessage[i])")
            }
        }
        */

        
    }
    
   override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
        print("view will appear ")
    }
    
        
    @IBAction func sendMessage(_ sender: Any) {
        var messageString = String()
        print(txtField.text ?? AnyObject.self)
        messageString = txtField.text!
        
        if !((txtField.text?.isEmpty)!) {
            senderMessage.add(messageString)
            for i in 0..<senderMessage.count {
                //sender
                if i % 2 == 0 {
                    //image Work
//                    let imageView = UIImageView(frame: CGRect(x: 5 + 150, y: 10 , width: 250, height: 150))
//                    imageView.backgroundColor = UIColor.red
                    
                    let label = UILabel(frame: CGRect(x: 5 + 150, y: 10 + 90 * i, width: 250, height: 80))
                    label.backgroundColor = UIColor.white
                    label.text = senderMessage[i] as? String
                    
                    //set the directional lock so only 1 scroll direction is used at a time
                    scrollView.isDirectionalLockEnabled = true
                    //scrollView.addSubview(imageView)
                    scrollView.addSubview(label)
                }
                    //receiver
                else if i % 2 == 1 {
                    let label = UILabel(frame: CGRect(x: 5, y: 10 + 90 * i, width: 250, height: 80))
                    label.backgroundColor = UIColor.white
                    label.text = senderMessage[i] as? String
                    
                    //set the directional lock so only 1 scroll direction is used at a time
                    scrollView.isDirectionalLockEnabled = true
                    scrollView.addSubview(label)
                    
                    
                    
                    
                    
                    
                    print(label.text)

                    
                    
                }
            }
        }
        
        /*
         if sendBool == true || (txtField.text?.isEmpty)! {
            receiveMessageCellBool = false
            senderMessage.add(messageString)
            sendBool = false
            GetBool = true
            print(senderMessage)
            sendMessageCellBool = true
            //self.tblView.reloadData()
            
            for i in 0..<senderMessage.count {
                if i % 2 == 0 {
                    print("sender even ==== \(senderMessage[i])")
                    if sendMessageCellBool == true
                    {
                        let label = UILabel(frame: CGRect(x: 5, y: 10 + 90 * i, width: 250, height: 80))
                        label.backgroundColor = UIColor.white
                        label.text = senderMessage[i] as? String
                        
                        //set the directional lock so only 1 scroll direction is used at a time
                        scrollView.isDirectionalLockEnabled = true
                        scrollView.addSubview(label)
                    }
                }
            }
            return
        }
        if GetBool == true || !((txtField.text?.isEmpty)!){
            sendMessageCellBool = false
            receiverMessage.add(messageString)
            //senderMessage.add(messageString)
            GetBool = false
            sendBool = true
            print(receiverMessage)
            receiveMessageCellBool = true
            //self.tblView.reloadData()
         
            for i in 0..<receiverMessage.count {
                if i % 2 == 1
                {
                    print("receiver odd ==== \(receiverMessage[i])")
                    if receiveMessageCellBool == true {
                        let label = UILabel(frame: CGRect(x: 5 + 150, y: 10 + 90 * i, width: 250, height: 80))
                        label.backgroundColor = UIColor.white
                        label.text = receiverMessage[i] as? String
                        
                        //set the directional lock so only 1 scroll direction is used at a time
                        scrollView.isDirectionalLockEnabled = true
                        scrollView.addSubview(label)
                    }
                }
            }
            return
        }
     */
    }

      override  func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: Camera controller Functions
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        NSLog("\(info)")
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        imagePickerController(picker, pickedImage: image)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, pickedImage: UIImage?) {
        if let image = pickedImage {
            //img_router.image = image as UIImage
            dismiss(animated: true, completion: nil)
        }
    }
    
    //MARK: Action methods
    @IBAction func takePhoto(_ sender: Any) {
        imagePicker.allowsEditing = false
        //imagePicker.sourceType = .camera
        //imagePicker.cameraDevice = .front
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    //MARK: UITextField Delegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let returnValue = true
        
        return  returnValue
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        txtField.resignFirstResponder()
        return true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return senderMessage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        ///let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "cell")
        //let cell = tableView.dequeueReusableCell(withIdentifier: "senderCell", for: indexPath) as! SenderMessageCell
        //cell.senderMessageLabel?.text = self.senderMessage[indexPath.row] as? String
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "senderCell", for: indexPath) as! SenderMessageCell
        
        for i in 0..<senderMessage.count {
            if i % 2 == 0 {
                print("sender even ==== \(senderMessage[i])")
                if sendMessageCellBool == true
                {
                    cell.senderMessageLabel?.text = self.senderMessage[indexPath.row] as? String
                    //cell.receiverMessageLabel?.text = nil
                    return cell
                }
            }
        }
        
        for i in 0..<receiverMessage.count {
             if i % 2 == 1
            {
                print("receiver odd ==== \(receiverMessage[i])")
                if receiveMessageCellBool == true {
                    cell.receiverMessageLabel?.text = self.receiverMessage[indexPath.row] as? String
                    //cell.senderMessageLabel?.text = nil
                    return cell
                }
            }
        }

        /////
        
        /*
        //Even
        receiverMessage = ["a", "b", "c", "d", "e", "f"]
        for i in 0..<receiverMessage.count {
            if i % 2 == 0 {
                print("sender even ==== \(receiverMessage[i])")
            }
        }
        
        //Odd
        for i in 0..<receiverMessage.count {
            if i % 2 == 1 {
                print("receiver odd ==== \(receiverMessage[i])")
            }
        }
        */

        
        
       // return cell
        
        /*
        if sendMessageCellBool == true
        {
          let cell = tableView.dequeueReusableCell(withIdentifier: "senderCell", for: indexPath) as! SenderMessageCell
            cell.senderMessageLabel?.text = self.senderMessage[indexPath.row] as? String
            return cell

        }
      else if receiveMessageCellBool == true {
            let cell = tableView.dequeueReusableCell(withIdentifier: "receiverCell", for: indexPath) as! ReceiverMessageCell
            cell.receiverMessageLabel?.text = self.receiverMessage[indexPath.row] as? String
            return cell

        }
        
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "senderCell", for: indexPath) as! SenderMessageCell
            cell.senderMessageLabel?.text = self.senderMessage[indexPath.row] as? String
            return cell
            //set the data here
        }
    }
 
    */
        //cell.textLabel?.text = self.senderMessage[indexPath.row] as? String
        
    

        return cell

    }
    
    
    
}





