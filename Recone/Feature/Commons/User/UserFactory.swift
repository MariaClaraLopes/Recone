//
//  UserFactory.swift
//  HomeScreen
//
//  Created by Maria Clara Lopes on 16/05/21.
//

import UIKit

struct UserFactory {
    static func registerUser() -> [User]{
        let user: [User] =
            [User(image: UIImage(named: "TestImage1"),
                  name: "Maria Clara",
                  age: "23 anos",
                  category: "Tecnologia",
                  occupation: "Desenvolvedor iOS",
                  localization: "Belo Horizonte",
                  contactNumber: "(11) 32820-4281"),
             User(image: UIImage(named: "TestImage2"),
                  name: "Caio",
                  age: "40 anos",
                  category: "Arte",
                  occupation: "Tatuador Fineline",
                  localization: "Brasília",
                  contactNumber: "(12) 32820-4281"),
             User(image: UIImage(named: "TestImage3"),
                  name: "Elen",
                  age: "26 anos",
                  category: "Design",
                  occupation: "Estilista",
                  localization: "Rio de Janeiro",
                  contactNumber: "(13) 32820-4281"),
             User(image: UIImage(named: "TestImage4"),
                  name: "Carlos",
                  age: "35 anos",
                  category: "Arte",
                  occupation: "Artista Plástico",
                  localization: "São Paulo",
                  contactNumber: "(14) 32820-4281")]
        return user
    }
}

