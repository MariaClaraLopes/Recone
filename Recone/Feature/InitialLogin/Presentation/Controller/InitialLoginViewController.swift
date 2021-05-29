//
//  InitialLoginViewController.swift
//  HomeScreen
//
//  Created by Maria Clara Lopes on 18/05/21.
//

import UIKit
import SafariServices

final class InitialLoginViewController: UIViewController {
    private let customInitialLogin = InitialLoginView()
    private let customLogin = LoginView()
    private let customProfile = ProfileView()
    private var user: UserResponse? = nil
    
    override func loadView() {
        self.view = customInitialLogin
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if AppSession.isUserLoggedIn() {
            makeRequest()
        }
        updateView()
    }
    
    private func bind() {
        customInitialLogin.didTapOk = { [weak self] button in
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            loginVC.delegate = self
            self?.present(loginVC, animated: true, completion: nil)
        }
        
        customProfile.scrollViewProfile.didTapExit = { [weak self] button in
            self?.updateView()
        }
        
        customProfile.scrollViewProfile.didTapLinkJob = { [weak self] button, url in
            let safariVC = SFSafariViewController(url: url)
            self?.present(safariVC, animated: true, completion: nil)
        }
    }
    
    private func updateView() {
        if AppSession.isUserLoggedIn() {
            self.view = customProfile
        } else {
            self.view = customInitialLogin
        }
    }
    
    private func makeRequest() {
        let id = AppSession.getId()
        ApiService.getUsers(by: id, endPoint: .id) {  [weak self] result in
            switch result {
            case .success(let user):
                self?.user = user
                self?.customProfile.scrollViewProfile.updateUI(user: user)
                if let achievements = user.achievements, let gallery = user.imageGallery {
                    self?.validate(achievements: achievements, gallery: gallery)
                }
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
    
    private func makeAchievements(achievements: [Achievements]) {
        // ---- ExStarts
        var dataAchievement: [AchievementsView.AchievementsModel] = []
        for item in achievements {
            if let description = item.description, !item.name.isEmpty {
                let date = item.date
                dataAchievement.append(AchievementsView.AchievementsModel(achievementSubTitle: "\(description) - \(item.name)", dateAchievement: date))
            } else if !item.name.isEmpty {
                dataAchievement.append(AchievementsView.AchievementsModel(achievementSubTitle: item.name, dateAchievement: item.date))
            } else {
                dataAchievement.append(AchievementsView.AchievementsModel(achievementSubTitle: item.description!, dateAchievement: item.date))
            }
        }
        customProfile.scrollViewProfile.achievementsView.updateLayout(achievements: dataAchievement)
        //---- ExEnd

    }
    
    private func validate(achievements: [Achievements], gallery: [String]) {
        if !achievements.isEmpty {
            makeAchievements(achievements: achievements)
        }
        
        if !gallery.isEmpty {
            makeGallery(gallery: gallery)
        }
    }

    private func makeGallery(gallery: [String]) {
        // --- Gallery
        var dataGallery: [GalleryView.GalleryModel] = []
        dataGallery.append(GalleryView.GalleryModel(
                            imageGalleryOne: gallery[0],
                            imageGalleryTwo: gallery[1],
                            imageGalleryThree: gallery[2]))
        
        dataGallery.append(GalleryView.GalleryModel(
                            imageGalleryOne: gallery[3],
                            imageGalleryTwo: gallery[4],
                            imageGalleryThree: gallery[5]))
        customProfile.scrollViewProfile.galleryView.updateLayout(gallerys: dataGallery)
        // ----

        
//        // --- Gallery
//        var dataGallery: [GalleryView.GalleryModel] = []
//        for _ in 1...2 {
//            dataGallery.append(GalleryView.GalleryModel(
//                imageGalleryOne: UIImage(named: "TestGallery") ?? UIImage(),
//                imageGalleryTwo: UIImage(named: "TestGallery") ?? UIImage(),
//                imageGalleryThree: UIImage(named: "TestGallery") ?? UIImage()))
//        }
//        customProfile.scrollViewProfile.galleryView.updateLayout(gallerys: dataGallery)
//        // ----
    }
}

extension InitialLoginViewController: LoginViewControllerDelegate {
    func update(id: String) {
        AppSession.updateUser(id: id)
    }
}
