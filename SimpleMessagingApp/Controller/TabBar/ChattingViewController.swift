//
//  ChattingViewController.swift
//  SimpleMessagingApp
//
//  Created by Raju Gupta on 31/05/20.
//  Copyright © 2020 Raju Gupta. All rights reserved.
//

import UIKit

class ChattingViewController: UIViewController {

    @IBOutlet weak var messageTableView: UITableView!
    @IBOutlet weak var txtMessage: DesignableTextField!
    @IBOutlet weak var btnSend: DesignableButton!
    
    var recieverUser : UserDataModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func onClickBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickSend(_ sender: Any) {
    }
}

extension ChattingViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath) as! MessageCell
        cell.setMessageType(type: .outgoing)
        return cell
    }
    
    
}
