//
//  ProfileViewController.swift
//  MindVocabs
//
//  Created by Kadir Hocaoğlu on 12.10.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let profileScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        scrollView.isUserInteractionEnabled = true
        return scrollView
    }()
    private let profilePhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.circle")
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    private let nameLabel: UILabel = {
        let label = PaddingLabel()
        label.backgroundColor = .clear
        label.layer.cornerRadius = 12
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.lightGray.cgColor
        
        return label
    }()
    private let lastNameLabel: UILabel = {
        let label = PaddingLabel()
        label.backgroundColor = .clear
        label.layer.cornerRadius = 12
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.lightGray.cgColor
        
        return label
    }()
    private let emailLabel: UILabel = {
        let label = PaddingLabel()
        label.backgroundColor = .clear
        label.layer.cornerRadius = 12
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.lightGray.cgColor
        return label
    }()
    private let saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 12
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.backgroundColor = .link
        button.isHidden = true
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profil"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        view.backgroundColor = .systemBackground
        configureProfile()
        view.isUserInteractionEnabled = true
        // MARK: - AddSubview
        view.addSubview(profileScrollView)
        profileScrollView.addSubview(profilePhotoImageView)
        profileScrollView.addSubview(nameLabel)
        profileScrollView.addSubview(lastNameLabel)
        profileScrollView.addSubview(emailLabel)
        profileScrollView.addSubview(saveButton)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(profilePhotoEditSave))
        gesture.delegate = self
        profilePhotoImageView.addGestureRecognizer(gesture)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        profileScrollView.frame = view.bounds
        let size = profileScrollView.width / 3
        profilePhotoImageView.frame = CGRect(x: ( profileScrollView.width - size) / 2 , y: profileScrollView.top + 10  , width: size, height: size)
        nameLabel.frame = CGRect(x: 30 , y: profilePhotoImageView.bottom + 10, width: profileScrollView.width - 60, height: 40)
        lastNameLabel.frame = CGRect(x: 30 , y: nameLabel.bottom + 10, width: profileScrollView.width - 60, height: 40)
        emailLabel.frame = CGRect(x: 30 , y: lastNameLabel.bottom + 10, width: profileScrollView.width - 60, height: 40)
        saveButton.frame = CGRect(x: 30 , y: emailLabel.bottom + 10, width: profileScrollView.width - 60, height: 40)
    }
    // MARK: - Functions
    @objc func profilePhotoEditSave() {
        saveButton.isHidden = false
        presentPhotoActionSheet()
    }
    func configureProfile() {
        nameLabel.text = "Kadir"
        lastNameLabel.text = "Hocaoğlu"
        emailLabel.text = "kadir@gmail.com"
    }

}
// MARK: - Gesture Extensions

extension ProfileViewController: UIGestureRecognizerDelegate {
    
}
// MARK: - ImagePicker
extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func presentPhotoActionSheet() {
        let actionSheet = UIAlertController(title: "Profile Picture", message: "How would you like to select a picture?", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        actionSheet.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: { [weak self] _ in
            self?.presentCamera()
        }))
        actionSheet.addAction(UIAlertAction(title: "Choose Photo", style: .default, handler: { [weak self] _ in
            self?.presentPhotoPicker()
        }))
        present(actionSheet, animated: true)
        
    }
    func presentCamera() {
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    func presentPhotoPicker() {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        print(info)
        guard let selectedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else { return }
        
        self.profilePhotoImageView.image = selectedImage
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}
