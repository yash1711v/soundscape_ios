//
//  StackCardViewModel.swift
//  Soundscape
//
//  Created by YASH VERMA on 30/04/24.
//

import SwiftUI

class StackCardViewModel: ObservableObject{
    @Published var cards: [Card] = []
       
       // Function to add a new card
       func addCard(with mainStorySound: MainStorySound) {

           let newCard = Card(mainStorySound: mainStorySound)
           cards.append(newCard)
       }
    
}
