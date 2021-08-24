//
//  ChatViewController.swift
//  chitchat
//
//  Created by Liza Bipin on 14/08/21.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {
    
    let db = Firestore.firestore()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    var messages: [Message] = [
        Message(sender: "1@2.com", body: "hiii"),
        Message(sender: "a@b.com", body: "hello"),
        Message(sender: "1@2.com", body: "sup")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        title = K.appName
        navigationItem.hidesBackButton = true
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        loadMessages()
    }
    
    
    @IBAction func sendPressed(_ sender: Any) {
        
        if let messageBody = messageTextfield.text, let messagesender = Auth.auth().currentUser?.email{
            db.collection(K.FStore.collectionName).addDocument(data:[
                                                                K.FStore.senderField : messagesender,
                                                                K.FStore.bodyField: messageBody]) { error in
                if let e = error{
                    print("oops there was some error, \(e)")
                    
                }
                else{
                    print("Saved data successfully")
                }
                
            }
        }
    }
    
    
    func loadMessages (){
        messages = []
        db.collection(K.FStore.collectionName).getDocuments { querySnapshot, error in
            if let e = error{
                print("there was an error \(e)")
            }
            else {
                if let snapshotDocuments = querySnapshot?.documents{
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        
                        //data is of type Any
                        if let messageSender = data[K.FStore.senderField] as? String, let messageBody = data[K.FStore.bodyField] as? String {
                            let newMessage = Message(sender: messageSender, body: messageBody)
                            self.messages.append(newMessage)
                            
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }
                            
                        }
                    }
                }
            }
        }
    }
    
    @IBAction func logoutButtonPressed(_ sender: UIBarButtonItem) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    
}

extension ChatViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    //create a cell and return to tableView
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        cell.label.text = messages[indexPath.row].body
        return cell
    }
    
    
}

