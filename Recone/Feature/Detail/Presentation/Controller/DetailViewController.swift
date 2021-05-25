//
//  DetailViewController.swift
//  HomeScreen
//
//  Created by Maria Clara Lopes on 14/05/21.
//

import UIKit

final class DetailViewController: UIViewController {
    
    var user: User? = nil
    
    private let customDetail = DetailView()
        
    override func loadView() {
        self.view = customDetail
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ---- ExStarts
        var dataAchievement: [AchievementsView.AchievementsModel] = []
        for _ in 1...3 {
            dataAchievement.append(AchievementsView.AchievementsModel(achievementSubTitle: "Trabalho Voluntário - Tech4Covid", dateAchievement: "Outubro de 2020"))
        }
        customDetail.scrollViewDetail.achievementsView.updateLayout(achievements: dataAchievement)
        //---- ExEnd
        
        // --- Gallery
        var dataGallery: [GalleryView.GalleryModel] = []
        for _ in 1...2 {
            dataGallery.append(GalleryView.GalleryModel(imageGalleryOne: UIImage(named: "TestGallery") ?? UIImage(), imageGalleryTwo: UIImage(named: "TestGallery") ?? UIImage(), imageGalleryThree: UIImage(named: "TestGallery") ?? UIImage()))
        }
        customDetail.scrollViewDetail.galleryView.updateLayout(gallerys: dataGallery)
        // ----
        
        bind()
    }
    
    private func bind() {
        customDetail.scrollViewDetail.didTapBack = { [weak self] button in
            self?.dismiss(animated: true)
        }
    }
    
    func updateUser(user: User) {
        self.user = user
        if let safeUser = self.user {
            customDetail.scrollViewDetail.updateImage(image: safeUser.image ?? UIImage())
            customDetail.scrollViewDetail.updateName(name: safeUser.name ?? String())
            customDetail.scrollViewDetail.updateCategory(category: safeUser.category ?? String())
            customDetail.scrollViewDetail.updateLocalization(localization: safeUser.localization ?? String())
            customDetail.scrollViewDetail.updateContactNumber(contactNumber: safeUser.contactNumber ?? String())
            customDetail.scrollViewDetail.biographyView.updateOccupation(occupation: safeUser.occupation ?? String())
            customDetail.scrollViewDetail.biographyView.updateAge(age: safeUser.age ?? String())
            
        }
    }
}



