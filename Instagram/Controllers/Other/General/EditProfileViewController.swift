//
//  EditProfileViewController.swift
//  Instagram
//
//  Created by kamilcal on 4.12.2022.
//

import UIKit

class EditProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(didTapSave))
                                                            
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel",
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(didTapCancel))
                                                           }
        
        @objc private func didTapSave(){
            
        }
        
        @objc private func didTapCancel() {
            
        }
    
    @objc private func didTapChangeProfilePicture() {
        let alert = UIAlertController(title: "Profile Picture",
                                       message: "Change profile picture",
                                       preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: { _ in
            
        } ))
        alert.addAction(UIAlertAction(title: "Chose from Libarary", style: .default, handler: { _ in
            
        } ))
        alert.addAction(UIAlertAction(title: "Cancel", style: .default))
        
        //        alert.popoverPresentationController?.sourceView = tableView
        //        alert.popoverPresentationController?.sourceRect= tableView.bounds
       
        present(alert, animated: true)
        } 
    }
    
