//
//  ProfileViewController.swift
//  HomeScreen
//
//  Created by Maria Clara Lopes on 17/05/21.
//

import UIKit

final class ProfileViewController: UIViewController {
    var user: User? = nil
    
    private let customProfile = ProfileView()
        
    override func loadView() {
        super.loadView()
        self.view = customProfile
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ---- ExStarts
        var dataAchievement: [AchievementsView.AchievementsModel] = []
        for _ in 1...3 {
            dataAchievement.append(AchievementsView.AchievementsModel(achievementSubTitle: "Trabalho Voluntário - Tech4Covid", dateAchievement: "Outubro de 2020"))
        }
        customProfile.scrollViewProfile.achievementsView.updateLayout(achievements: dataAchievement)
        //---- ExEnd
        
        // --- Gallery
        var dataGallery: [GalleryView.GalleryModel] = []
        for _ in 1...2 {
            dataGallery.append(GalleryView.GalleryModel(imageGalleryOne: UIImage(named: "TestGallery") ?? UIImage(), imageGalleryTwo: UIImage(named: "TestGallery") ?? UIImage(), imageGalleryThree: UIImage(named: "TestGallery") ?? UIImage()))
        }
        customProfile.scrollViewProfile.galleryView.updateLayout(gallerys: dataGallery)
        // ----
        
        bind()

    }
    
    private func bind() {
        customProfile.scrollViewProfile.didTapExit = { [weak self] button in
            AppSession.updateUser(isLoggedIn: false)
            self?.dismiss(animated: true)
        }
    }
    
    func updateUser(user: User) {
        self.user = user
        if let safeUser = self.user {
            customProfile.scrollViewProfile.updateImage(image: safeUser.image ?? UIImage())
            customProfile.scrollViewProfile.updateName(name: safeUser.name ?? String())
            customProfile.scrollViewProfile.updateCategory(category: safeUser.category ?? String())
            customProfile.scrollViewProfile.updateLocalization(localization: safeUser.localization ?? String())
            customProfile.scrollViewProfile.updateContactNumber(contactNumber: safeUser.contactNumber ?? String())
            customProfile.scrollViewProfile.biographyView.updateOccupation(occupation: safeUser.occupation ?? String())
            customProfile.scrollViewProfile.biographyView.updateAge(age: safeUser.age ?? String())
            
        }
    }
}

