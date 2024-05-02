//
//  StackCardView.swift
//  Soundscape
//
//  Created by YASH VERMA on 30/04/24.
//

import SwiftUI

var width = UIScreen.main.bounds.width

struct StackCardView: View {
    
    @EnvironmentObject var model: StackCardViewModel
    
    
    @State private var isNavigationActive = false // State to control navigation

    
    var body: some View {
        ZStack{
            ForEach(model.cards.indices.reversed(),id: \.self){index in
                
                let card = model.cards[index]
                HStack {
                    CardView(
                                        card: model.cards[index],
                                        width: getCardWidth(index: index),
                                        height: getCardHeight(index: index), isNavigationActive: $isNavigationActive
                                    )
                    
                    .offset(x: getCardOffset(index: index))
                    .rotationEffect(.init(degrees: getCardRotation(index: index)))
            
                    Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                }
                 
                .contentShape(Rectangle())
                .offset(x:model.cards[index].offset)
                .gesture(
                    DragGesture(minimumDistance: 0)
                    .onChanged({(value) in
                        onChanged(value: value, index: index)
                    })
                    .onEnded({(value) in
                        onEnd(value: value, index: index)
                      
                    })
                
                
                )
                .simultaneousGesture(
                    TapGesture()
        
                        .onEnded {
                            // Handle tap gesture
                            // You can perform any action here when tap is detected
                            print("Tap gesture occurred")
                            isNavigationActive=true
                        }
                )
                
              
            }
        }.onAppear{
            loadCards()
        }
        .padding(.top,0)
        .padding(.leading,20)
    }
    
    private func loadCards() {
        self.model.cards.removeAll()
        for mainStorySound in MainStorySoundData.miniStoryList {
            self.model.addCard(with: mainStorySound)
        }
        
    }
    
    
    func onChanged(value: DragGesture.Value,index: Int){
        
        if value.translation.width < 0 {
            
            model.cards[index].offset = value.translation.width
        }
        
    }
    func getCardRotation(index: Int) -> Double{
        
       let boxWidth = Double(width / 50)
        
        let offset = Double(model.cards[index].offset)
        
        return  offset / boxWidth
        
    }
    
    func onEnd(value: DragGesture.Value, index: Int) {
        let threshold = width / 100
        let swipeDistance = -value.translation.width
        
        if swipeDistance > threshold {
            // Card has been swiped beyond the threshold, move it behind other cards
            withAnimation {
                model.cards[index].offset = 0 // Reset offset
                let removedCard = model.cards.remove(at: index)
                model.cards.insert(removedCard, at: model.cards.endIndex)
            }
        } else {
            // Card has not been swiped beyond the threshold, reset its position
            withAnimation {
                model.cards[index].offset = 0
            }
        }
    }

    
    func getCardHeight(index: Int)->CGFloat{
        
        let height:CGFloat = 150
        let cardHeight =  index <= 2 ? CGFloat(index) * 35 : 70
        
        return height
    }
    func getCardWidth(index: Int)->CGFloat{
        let boxWidth = UIScreen.main.bounds.width - 60 - 60
        
        let cardWidth =  index <= 2 ? CGFloat(index) * 30 : 60
        
         return boxWidth
 
    }
    
    func getCardOffset(index: Int)->CGFloat{
        return index <= 5 ? CGFloat(index) * 20 : 65
    }
}




struct CardView: View {
    var card: Card
    var width: CGFloat
    var height: CGFloat
    @Binding var isNavigationActive: Bool // Binding to control navigation link's activation

    var body: some View {
        
        ZStack {
            // Use image as background
            Image(card.mainStorySound.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: width, height: height)
                .cornerRadius(10)
                .clipped()
        
            // Place the name at the bottom left
            HStack {
                Text(card.mainStorySound.name)
                    .foregroundColor(.white)
                    .padding(.leading, 8)
                    .padding(.bottom, 8)
                Spacer()
            }
            .frame(width: width, height: height, alignment: .bottomLeading)
        }
        .background(
            NavigationLink(destination: StoryDetailView(mainStorySound: card.mainStorySound), isActive: $isNavigationActive) {
                           EmptyView()
                       }
        )
    }
}


#Preview {
    StoryView()
}

