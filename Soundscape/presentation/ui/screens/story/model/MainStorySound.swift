//
//  MiniStorySound.swift
//  Soundscape
//
//  Created by Aman Kumar on 05/03/24.
//

import Foundation

struct MainStorySound: Hashable, Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let listenerCount: Int64
    let description: String
    let episodeList: [Episode]
}

struct MainStorySoundData {
    static let sampleStorySound = MainStorySound(name: "The Young Scout",
                                                 imageName: "theYoungScoutEP1",
                                                 listenerCount: 2,
                                                 description: "Young Andrew Jackson bravely stood up to the British in the Revolutionary War. Even when captured, he didn't back down. What happens next is a mystery. Released, his story takes an interesting turn, leading to something big in American history. Get ready for an exciting journey from a brave kid to a super important person!",
                                                 episodeList: [
                                                    Episode(name: "Episode 1",
                                                            songName: "The Young Scout",
                                                            imageName: "theYoungScoutEP1",
                                                            songPath: "http://soundscape.boostproductivity.online/api/getmusic/theYoungScout")
                                                 ])
    
    static let theStarrryJourneyItem = MainStorySound(name: "The Starry Journey",
                                                      imageName: "theStarryJourneyEP1",
                                                      listenerCount: 2,
                                                      description: "Elara, a curious girl in Willow Creek, takes a magical journey among the stars, uncovering the universe's secrets. Her enchanting tales transform the village into a beacon of dreams. As Elara wishes for another cosmic adventure, the villagers gather under the starry sky, anticipating the next extraordinary chapter.",
                                                      episodeList: [
                                                        Episode(name: "Episode 1",
                                                                songName: "The Starry Journey",
                                                                imageName: "theStarryJourneyEP1",
                                                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/theStarryJourney")])
    
    static let miniStoryList = [
        MainStorySound(name: "The Young Scout",
                       imageName: "theYoungScoutEP1",
                       listenerCount: 2,
                       description: "Young Andrew Jackson bravely stood up to the British in the Revolutionary War. Even when captured, he didn't back down. What happens next is a mystery. Released, his story takes an interesting turn, leading to something big in American history. Get ready for an exciting journey from a brave kid to a super important person!",
                       episodeList: [
                        Episode(name: "Episode 1",
                                songName: "The Young Scout",
                                imageName: "theYoungScoutEP1",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/theYoungScout")
                       ]),
        
        MainStorySound(name: "The Starry Journey",
                       imageName: "theStarryJourneyEP1",
                       listenerCount: 2,
                       description: "Elara, a curious girl in Willow Creek, takes a magical journey among the stars, uncovering the universe's secrets. Her enchanting tales transform the village into a beacon of dreams. As Elara wishes for another cosmic adventure, the villagers gather under the starry sky, anticipating the next extraordinary chapter.",
                       episodeList: [
                        Episode(name: "Episode 1",
                                songName: "The Starry Journey",
                                imageName: "theStarryJourneyEP1",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/theStarryJourney")]),
        
        MainStorySound(name: "City Of the Sun Part 1",
                       imageName: "cityOfTheSunPart1EP1",
                       listenerCount: 2,
                       description: "A grand master who wandered over the whole earth but on a voyage he landed on a place that was a little different from the other places on the earth, he tells how it was different from other places and what was unique in it.",
                       episodeList: [
                        Episode(name: "Episode 1",
                                songName: "City Sun EP1",
                                imageName: "cityOfTheSunPart1EP1",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/cityOfTheSunPart1EP1"),
                        
                        Episode(name: "Episode 2",
                                songName: "City Sun EP2",
                                imageName: "cityOfTheSunPart1EP2",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/cityOfTheSunPart1EP2"),
                        
                        Episode(name: "Episode 3",
                                songName: "City Sun EP3",
                                imageName: "cityOfTheSunPart1EP3",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/cityOfTheSunPart1EP3")
                       ]),
        
        MainStorySound(name: "The Scar Part 1",
                       imageName: "theScarPart1EP1",
                       listenerCount: 2,
                       description: "A doctor, attending to a supposedly sick patient, unwittingly becomes entangled in a perilous situation. The routine medical visit unravels into a suspenseful narrative, revealing hidden dangers and unexpected twists.",
                       episodeList: [
                        Episode(name: "Episode 1",
                                songName: "The Scar Part1 EP1",
                                imageName: "theScarPart1EP1",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/theScarPart1EP1"),
                        
                        Episode(name: "Episode 2",
                                songName: "The Scar Part1 EP2",
                                imageName: "theScarPart1EP2",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/theScarPart1EP2"),
                        
                        Episode(name: "Episode 3",
                                songName: "The Scar Part1 EP3",
                                imageName: "theScarPart1EP3",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/theScarPart1EP3")
                       ])
    ]
    
    static let mysteryTalesList = [
        MainStorySound(name: "Two Great Painters",
                       imageName: "twoGreatPaintersEP1",
                       listenerCount: 2,
                       description: "Two artists, Zeuxis and Parrhasius, have a painting rivalry. Zeuxis brags about fooling birds, but Parrhasius outsmarts him. Zeuxis fails with cherries, and the competition heats up. Zeuxis surprises with a market painting, leaving us eager for the next twist in their artistic tale!",
                       episodeList: [
                        Episode(name: "Episode 1",
                                songName: "Painter EP1",
                                imageName: "twoGreatPaintersEP1",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/twoGreatPaintersEP1")
                       ]),
        
        MainStorySound(name: "The Calliph & The Gardner",
                       imageName: "theCaliphAndTheGardenerEP1",
                       listenerCount: 2,
                       description: "Caliph Al Mansour buys jewels from a merchant, whose money gets stolen by an eagle while he bathes. A year later, the merchant, now destitute, sells remaining jewels. The caliph learns of a fortunate gardener, sparking his interest and setting the stage for a deeper investigation.",
                       episodeList: [
                        Episode(name: "Episode 1",
                                songName: "The Caliph EP1",
                                imageName: "theCaliphAndTheGardenerEP1",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/theCaliphAndTheGardenerEP1"),
                        
                        Episode(name: "Episode 2",
                                songName: "The Caliph EP1",
                                imageName: "theCaliphAndTheGardenerEP2",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/theCaliphAndTheGardenerEP2")
                       ]),
        
        MainStorySound(name: "Myth And The Legends Around The World Part 1",
                       imageName: "howThorLostHisHammerPart1EP1",
                       listenerCount: 2,
                       description: "Discover stories about myths and legends from the past. Listen to engaging tales that unfold the wonders of ancient times and legendary stories from around the world. Explore these stories to learn about the fascinating myths and legends of days gone by.",
                       episodeList: [
                        Episode(name: "Episode 1",
                                songName: "How Thor lost his hammer",
                                imageName: "howThorLostHisHammerPart1EP1",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/mythAndTheLegendsAroundTheWorldPart1EP1"),
                        
                        Episode(name: "Episode 2",
                                songName: "The Ape, the Snake and the Lion",
                                imageName: "theApeTheSnakeAndTheLionPart1EP2",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/mythAndTheLegendsAroundTheWorldPart1EP2"),
                        
                        Episode(name: "Episode 3",
                                songName: "The Death of Sir Launcelot",
                                imageName: "theDeathOfSirLauncelotPart1EP3",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/mythAndTheLegendsAroundTheWorldPart1EP3"),
                        
                        Episode(name: "Episode 4",
                                songName: "The First Corn",
                                imageName: "theFirstCornEP4",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/mythAndTheLegendsAroundTheWorldPart1EP4"),
                        
                        Episode(name: "Episode 5",
                                songName: "The Punishment of Loki",
                                imageName: "thePunishmentOfLokiPart1EP5",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/mythAndTheLegendsAroundTheWorldPart1EP5"),
                        
                        Episode(name: "Episode 6",
                                songName: "The Twilight of the Gods",
                                imageName: "theTwilightOfTheGodsPart1EP6",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/mythAndTheLegendsAroundTheWorldPart1EP6")
                       ]),
        
        MainStorySound(name: "Myth And The Legends Around the World Part 2",
                       imageName: "theGiantBehindTheWaterfallEP1",
                       listenerCount: 2,
                       description: "Discover stories about myths and legends from the past. Listen to engaging tales that unfold the wonders of ancient times and legendary stories from around the world. Explore these stories to learn about the fascinating myths and legends of days gone by.",
                       episodeList: [
                        Episode(name: "Episode 1",
                                songName: "The Giant behind the Waterfall",
                                imageName: "theGiantBehindTheWaterfallEP1",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/mythAndTheLegendsAroundTheWorldPart2EP1"),
                        
                        Episode(name: "Episode 2",
                                songName: "The Old Women",
                                imageName: "theOldWomenEP2",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/mythAndTheLegendsAroundTheWorldPart2EP2"),
                        
                        Episode(name: "Episode 3",
                                songName: "His call to Bran",
                                imageName: "hisCallToBranEP3",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/mythAndTheLegendsAroundTheWorldPart2EP3"),
                        
                        Episode(name: "Episode 4",
                                songName: "Baldur",
                                imageName: "baldurEP4",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/mythAndTheLegendsAroundTheWorldPart2EP4"),
                        
                        Episode(name: "Episode 5",
                                songName: "The Cow of plenty",
                                imageName: "theCowOfPlentyEP5",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/mythAndTheLegendsAroundTheWorldPart2EP5"),
                        
                        Episode(name: "Episode 6",
                                songName: "The Bakers Dozen",
                                imageName: "theBakersDozenEP6",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/mythAndTheLegendsAroundTheWorldPart2EP6")
                       ]),
    ]
    
    static let inspirationalStoriesList = [
        MainStorySound(name: "Two Great Painters",
                       imageName: "twoGreatPaintersEP1",
                       listenerCount: 2,
                       description: "Two artists, Zeuxis and Parrhasius, have a painting rivalry. Zeuxis brags about fooling birds, but Parrhasius outsmarts him. Zeuxis fails with cherries, and the competition heats up. Zeuxis surprises with a market painting, leaving us eager for the next twist in their artistic tale!",
                       episodeList: [
                        Episode(name: "Episode 1",
                                songName: "Painter EP1",
                                imageName: "twoGreatPaintersEP1",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/twoGreatPaintersEP1")
                       ]),
        
        MainStorySound(name: "The Young Scout",
                       imageName: "theYoungScoutEP1",
                       listenerCount: 2,
                       description: "Young Andrew Jackson bravely stood up to the British in the Revolutionary War. Even when captured, he didn't back down. What happens next is a mystery. Released, his story takes an interesting turn, leading to something big in American history. Get ready for an exciting journey from a brave kid to a super important person!",
                       episodeList: [
                        Episode(name: "Episode 1",
                                songName: "The Young Scout",
                                imageName: "theYoungScoutEP1",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/theYoungScout")
                       ]),
        
        MainStorySound(name: "The Lover of Men",
                       imageName: "theLoverOfManEP1",
                       listenerCount: 1,
                       description: "Far East Prince Gautama, sheltered in bliss, seeks the world's beauty. City exploration reveals a different reality, especially an encounter with an old man. What will the prince learn about life beyond his palace, setting the stage for an intriguing journey? The tale unfolds with anticipation.",
                       episodeList: [
                        Episode(name: "Episode 1",
                                songName: "The Lover of Men EP1",
                                imageName: "theLoverOfManEP1",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/theLoverOfManEP1"),
                        
                        Episode(name: "Episode 2",
                                songName: "The Lover of Men EP1",
                                imageName: "theLoverOfManEP2",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/theLoverOfManEP2")
                       ]),
        
        MainStorySound(name: "Mister Karter",
                       imageName: "mrKarterEP1",
                       listenerCount: 1,
                       description: "Four lawyers on horseback encounter baby robins fallen from their nest after a storm. Three lawyers dismiss the situation, but the fourth, Mr. Karter, takes the time to rescue and return them to their nest. His compassionate act surprises and amuses his companions, who mockingly call him a hero. As they continue their journey, the question lingers: Is there more to Mr. Karter's kindness than meets the eye?",
                       episodeList: [
                        Episode(name: "Episode 1",
                                songName: "Mr. Karter - The Kind Heart EP1",
                                imageName: "mrKarterEP1",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/mrKarterEP1"),
                        
                        Episode(name: "Episode 2",
                                songName: "Mr. Karter - The Kind Heart EP2",
                                imageName: "mrKarterEP2",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/mrKarterEP2")
                       ]),
        
        MainStorySound(name: "An Inspirational Man",
                       imageName: "anInspirationalManEP1",
                       listenerCount: 2,
                       description: "Quarrelsome Scotsman, Alexander Selkirk, becomes a sailor, ends up alone on Juan Fernandez island. Survives, unnoticed, for four years until a rescue. His tale catches a writer's eye, hinting at unexpected twists ahead.",
                       episodeList: [
                        Episode(name: "Episode 1",
                                songName: "An Inspirational Man EP1",
                                imageName: "anInspirationalManEP1",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/anInspirationalManEP1")
                        
                       ])
    ]
    
    static let historicalJourneyList = [
        MainStorySound(name: "The Lover of Men",
                       imageName: "theLoverOfManEP1",
                       listenerCount: 1,
                       description: "Far East Prince Gautama, sheltered in bliss, seeks the world's beauty. City exploration reveals a different reality, especially an encounter with an old man. What will the prince learn about life beyond his palace, setting the stage for an intriguing journey? The tale unfolds with anticipation.",
                       episodeList: [
                        Episode(name: "Episode 1",
                                songName: "The Lover of Men EP1",
                                imageName: "theLoverOfManEP1",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/theLoverOfManEP1"),
                        
                        Episode(name: "Episode 2",
                                songName: "The Lover of Men EP1",
                                imageName: "theLoverOfManEP2",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/theLoverOfManEP2")
                       ]),
        
        MainStorySound(name: "Myth And The Legends Around The World Part 1",
                       imageName: "howThorLostHisHammerPart1EP1",
                       listenerCount: 2,
                       description: "Discover stories about myths and legends from the past. Listen to engaging tales that unfold the wonders of ancient times and legendary stories from around the world. Explore these stories to learn about the fascinating myths and legends of days gone by.",
                       episodeList: [
                        Episode(name: "Episode 1",
                                songName: "How Thor lost his hammer",
                                imageName: "howThorLostHisHammerPart1EP1",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/mythAndTheLegendsAroundTheWorldPart1EP1"),
                        
                        Episode(name: "Episode 2",
                                songName: "The Ape, the Snake and the Lion",
                                imageName: "theApeTheSnakeAndTheLionPart1EP2",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/mythAndTheLegendsAroundTheWorldPart1EP2"),
                        
                        Episode(name: "Episode 3",
                                songName: "The Death of Sir Launcelot",
                                imageName: "theDeathOfSirLauncelotPart1EP3",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/mythAndTheLegendsAroundTheWorldPart1EP3"),
                        
                        Episode(name: "Episode 4",
                                songName: "The First Corn",
                                imageName: "theFirstCornEP4",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/mythAndTheLegendsAroundTheWorldPart1EP4"),
                        
                        Episode(name: "Episode 5",
                                songName: "The Punishment of Loki",
                                imageName: "thePunishmentOfLokiPart1EP5",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/mythAndTheLegendsAroundTheWorldPart1EP5"),
                        
                        Episode(name: "Episode 6",
                                songName: "The Twilight of the Gods",
                                imageName: "theTwilightOfTheGodsPart1EP6",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/mythAndTheLegendsAroundTheWorldPart1EP6")
                       ]),
        
        MainStorySound(name: "Myth And The Legends Around the World Part 2",
                       imageName: "theGiantBehindTheWaterfallEP1",
                       listenerCount: 2,
                       description: "Discover stories about myths and legends from the past. Listen to engaging tales that unfold the wonders of ancient times and legendary stories from around the world. Explore these stories to learn about the fascinating myths and legends of days gone by.",
                       episodeList: [
                        Episode(name: "Episode 1",
                                songName: "The Giant behind the Waterfall",
                                imageName: "theGiantBehindTheWaterfallEP1",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/mythAndTheLegendsAroundTheWorldPart2EP1"),
                        
                        Episode(name: "Episode 2",
                                songName: "The Old Women",
                                imageName: "theOldWomenEP2",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/mythAndTheLegendsAroundTheWorldPart2EP2"),
                        
                        Episode(name: "Episode 3",
                                songName: "His call to Bran",
                                imageName: "hisCallToBranEP3",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/mythAndTheLegendsAroundTheWorldPart2EP3"),
                        
                        Episode(name: "Episode 4",
                                songName: "Baldur",
                                imageName: "baldurEP4",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/mythAndTheLegendsAroundTheWorldPart2EP4"),
                        
                        Episode(name: "Episode 5",
                                songName: "The Cow of plenty",
                                imageName: "theCowOfPlentyEP5",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/mythAndTheLegendsAroundTheWorldPart2EP5"),
                        
                        Episode(name: "Episode 6",
                                songName: "The Bakers Dozen",
                                imageName: "theBakersDozenEP6",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/mythAndTheLegendsAroundTheWorldPart2EP6")
                       ]),
        
        MainStorySound(name: "City Of the Sun Part 1",
                       imageName: "cityOfTheSunPart1EP1",
                       listenerCount: 2,
                       description: "A grand master who wandered over the whole earth but on a voyage he landed on a place that was a little different from the other places on the earth, he tells how it was different from other places and what was unique in it.",
                       episodeList: [
                        Episode(name: "Episode 1",
                                songName: "City Sun EP1",
                                imageName: "cityOfTheSunPart1EP1",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/cityOfTheSunPart1EP1"),
                        
                        Episode(name: "Episode 2",
                                songName: "City Sun EP2",
                                imageName: "cityOfTheSunPart1EP2",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/cityOfTheSunPart1EP2"),
                        
                        Episode(name: "Episode 3",
                                songName: "City Sun EP3",
                                imageName: "cityOfTheSunPart1EP3",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/cityOfTheSunPart1EP3")
                       ])
    ]
    
    static let fantasyRealmsList = [
        MainStorySound(name: "The Young Scout",
                       imageName: "theYoungScoutEP1",
                       listenerCount: 2,
                       description: "Young Andrew Jackson bravely stood up to the British in the Revolutionary War. Even when captured, he didn't back down. What happens next is a mystery. Released, his story takes an interesting turn, leading to something big in American history. Get ready for an exciting journey from a brave kid to a super important person!",
                       episodeList: [
                        Episode(name: "Episode 1",
                                songName: "The Young Scout",
                                imageName: "theYoungScoutEP1",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/theYoungScout")
                       ]),
        
        MainStorySound(name: "The Starry Journey",
                       imageName: "theStarryJourneyEP1",
                       listenerCount: 2,
                       description: "Elara, a curious girl in Willow Creek, takes a magical journey among the stars, uncovering the universe's secrets. Her enchanting tales transform the village into a beacon of dreams. As Elara wishes for another cosmic adventure, the villagers gather under the starry sky, anticipating the next extraordinary chapter.",
                       episodeList: [
                        Episode(name: "Episode 1",
                                songName: "The Starry Journey",
                                imageName: "theStarryJourneyEP1",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/theStarryJourney")]),
        
        MainStorySound(name: "Mister Karter",
                       imageName: "mrKarterEP1",
                       listenerCount: 1,
                       description: "Four lawyers on horseback encounter baby robins fallen from their nest after a storm. Three lawyers dismiss the situation, but the fourth, Mr. Karter, takes the time to rescue and return them to their nest. His compassionate act surprises and amuses his companions, who mockingly call him a hero. As they continue their journey, the question lingers: Is there more to Mr. Karter's kindness than meets the eye?",
                       episodeList: [
                        Episode(name: "Episode 1",
                                songName: "Mr. Karter - The Kind Heart EP1",
                                imageName: "mrKarterEP1",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/mrKarterEP1"),
                        
                        Episode(name: "Episode 2",
                                songName: "Mr. Karter - The Kind Heart EP2",
                                imageName: "mrKarterEP2",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/mrKarterEP2")
                       ]),
        
        MainStorySound(name: "An Inspirational Man",
                       imageName: "anInspirationalManEP1",
                       listenerCount: 2,
                       description: "Quarrelsome Scotsman, Alexander Selkirk, becomes a sailor, ends up alone on Juan Fernandez island. Survives, unnoticed, for four years until a rescue. His tale catches a writer's eye, hinting at unexpected twists ahead.",
                       episodeList: [
                        Episode(name: "Episode 1",
                                songName: "An Inspirational Man EP1",
                                imageName: "anInspirationalManEP1",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/anInspirationalManEP1")
                        
                       ]),
        
        MainStorySound(name: "The Tale Of Squirrel Nutken",
                       imageName: "theTaleOfSquirrelNutkenEP1" ,
                       listenerCount: 2,
                       description: "Follow Nutken, a young red squirrel, and his brother Twikle Berry, as they embark on an autumn adventure to a special island with golden nuts, navigating a lake and encountering Old Brown, an owl who resides in a hollow oak tree. Join their thrilling journey in this fantastic tale!",
                       episodeList: [
                        Episode(name: "Episode 1",
                                songName: "The Tale of Squirrel Nutken",
                                imageName: "theTaleOfSquirrelNutkenEP1",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/theTaleOfSquirrelNutken")
                       ])
    ]
    
    static let adventureStoriesList = [
        MainStorySound(name: "The Starry Journey",
                       imageName: "theStarryJourneyEP1",
                       listenerCount: 2,
                       description: "Elara, a curious girl in Willow Creek, takes a magical journey among the stars, uncovering the universe's secrets. Her enchanting tales transform the village into a beacon of dreams. As Elara wishes for another cosmic adventure, the villagers gather under the starry sky, anticipating the next extraordinary chapter.",
                       episodeList: [
                        Episode(name: "Episode 1",
                                songName: "The Starry Journey",
                                imageName: "theStarryJourneyEP1",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/theStarryJourney")]),
        
        MainStorySound(name: "The Lover of Men",
                       imageName: "theLoverOfManEP1",
                       listenerCount: 1,
                       description: "Far East Prince Gautama, sheltered in bliss, seeks the world's beauty. City exploration reveals a different reality, especially an encounter with an old man. What will the prince learn about life beyond his palace, setting the stage for an intriguing journey? The tale unfolds with anticipation.",
                       episodeList: [
                        Episode(name: "Episode 1",
                                songName: "The Lover of Men EP1",
                                imageName: "theLoverOfManEP1",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/theLoverOfManEP1"),
                        
                        Episode(name: "Episode 2",
                                songName: "The Lover of Men EP1",
                                imageName: "theLoverOfManEP2",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/theLoverOfManEP2")
                       ]),
        
        MainStorySound(name: "The Tale Of Squirrel Nutken",
                       imageName: "theTaleOfSquirrelNutkenEP1" ,
                       listenerCount: 2,
                       description: "Follow Nutken, a young red squirrel, and his brother Twikle Berry, as they embark on an autumn adventure to a special island with golden nuts, navigating a lake and encountering Old Brown, an owl who resides in a hollow oak tree. Join their thrilling journey in this fantastic tale!",
                       episodeList: [
                        Episode(name: "Episode 1",
                                songName: "The Tale of Squirrel Nutken",
                                imageName: "theTaleOfSquirrelNutkenEP1",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/theTaleOfSquirrelNutken")
                       ])
    ]
    
    static let actionStoriesList = [
        MainStorySound(name: "The Young Scout",
                       imageName: "theYoungScoutEP1",
                       listenerCount: 2,
                       description: "Young Andrew Jackson bravely stood up to the British in the Revolutionary War. Even when captured, he didn't back down. What happens next is a mystery. Released, his story takes an interesting turn, leading to something big in American history. Get ready for an exciting journey from a brave kid to a super important person!",
                       episodeList: [
                        Episode(name: "Episode 1",
                                songName: "The Young Scout",
                                imageName: "theYoungScoutEP1",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/theYoungScout")
                       ]),
        
        MainStorySound(name: "The Scar Part 1",
                       imageName: "theScarPart1EP1",
                       listenerCount: 2,
                       description: "A doctor, attending to a supposedly sick patient, unwittingly becomes entangled in a perilous situation. The routine medical visit unravels into a suspenseful narrative, revealing hidden dangers and unexpected twists.",
                       episodeList: [
                        Episode(name: "Episode 1",
                                songName: "The Scar Part1 EP1",
                                imageName: "theScarPart1EP1",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/theScarPart1EP1"),
                        
                        Episode(name: "Episode 2",
                                songName: "The Scar Part1 EP2",
                                imageName: "theScarPart1EP2",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/theScarPart1EP2"),
                        
                        Episode(name: "Episode 3",
                                songName: "The Scar Part1 EP3",
                                imageName: "theScarPart1EP3",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/theScarPart1EP3")
                       ]),
        
        MainStorySound(name: "The Midnight Ride",
                       imageName: "theMidnightRideEP1",
                       listenerCount: 1,
                       description: "Under English rule, Boston rebels against oppression. Paul Revere, a brave figure, organizes a plan to warn of soldiers seizing powder. A secret signal initiates his midnight ride, leaving the outcome in suspense.",
                       episodeList: [
                        Episode(name: "Episode 1",
                                songName: "The Midnight Ride EP1",
                                imageName: "theMidnightRideEP1",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/theMidnightRideEP1"),
                        
                        Episode(name: "Episode 2",
                                songName: "The Midnight Ride EP2",
                                imageName: "theMidnightRideEP2",
                                songPath: "http://soundscape.boostproductivity.online/api/getmusic/theMidnightRideEP2")
                       ])
        
    ]
    
}
