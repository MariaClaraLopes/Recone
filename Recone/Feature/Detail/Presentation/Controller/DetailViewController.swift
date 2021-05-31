//
//  DetailViewController.swift
//  HomeScreen
//
//  Created by Maria Clara Lopes on 14/05/21.
//

import UIKit
import SafariServices

final class DetailViewController: UIViewController {
    private var id: String? = nil
    private var user: UserResponse? = nil
    private let customDetail = DetailView()
        
    override func loadView() {
        self.view = customDetail
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
        makeRequest()
    }
    
    private func bind() {
        customDetail.scrollViewDetail.didTapLinkJob = { [weak self] button, url in
            let safariVC = SFSafariViewController(url: url)
            self?.present(safariVC, animated: true, completion: nil)
        }
        
        customDetail.scrollViewDetail.didTapBack = { [weak self] button in
            self?.dismiss(animated: true)
        }
    }
    
    private func makeRequest() {
        guard let id = id else { return }
        ApiService.getUsers(by: id, endPoint: .id) {  [weak self] result in
            switch result {
            case .success(let user):
                self?.user = user
                self?.customDetail.scrollViewDetail.updateUI(user: user)
                if let achievements = user.achievements, let gallery = user.imageGallery {
                    self?.validate(achievements: achievements, gallery: gallery)
                }
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
    
    private func makeAchievements(achievements: [Achievements]) {
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
        customDetail.scrollViewDetail.achievementsView.updateLayout(achievements: dataAchievement)
    }
    
    private func makeGallery(gallery: [String]) {
        var dataGallery: [GalleryView.GalleryModel] = []
        dataGallery.append(GalleryView.GalleryModel(
                            imageGalleryOne: gallery[0],
                            imageGalleryTwo: gallery[1],
                            imageGalleryThree: gallery[2]))
        
        dataGallery.append(GalleryView.GalleryModel(
                            imageGalleryOne: gallery[3],
                            imageGalleryTwo: gallery[4],
                            imageGalleryThree: gallery[5]))
        customDetail.scrollViewDetail.galleryView.updateLayout(gallerys: dataGallery)
    }

    private func validate(achievements: [Achievements], gallery: [String]) {
        if !achievements.isEmpty {
            makeAchievements(achievements: achievements)
        }
        
        if !gallery.isEmpty {
            makeGallery(gallery: gallery)
        }
    }
    
    func updateID(id: String) {
        self.id = id
    }
}



