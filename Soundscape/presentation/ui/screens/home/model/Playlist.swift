//
//  Playlist.swift
//  Soundscape
//
//  Created by Aman Kumar on 29/02/24.
//

import Foundation

struct Playlist: Hashable, Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let description: [String]
    let listenerCount: Double
    let arrowToggle: Bool
}

struct PlaylistData {
    static let samplePlaylist = Playlist(name: "Fitness",
                                         imageName: "fitness",
                                         description: [
                                            "EmbraceFit: Your journey to a healthier, stronger, and happier you!",
                                            "RunStrong: Every step you take brings you closer to greatness.",
                                            "LiftHeavy: Elevate not just weights but also your strength within.",
                                            "GymLife: Where dedication shapes the body and molds the spirit.",
                                            "SweatItOut: The path to success is paved with hard work.",
                                            "ActiveLife: Seize each moment to move, play, and thrive.",
                                            "GoHarder: Challenge yourself, break limits, and redefine your potential.",
                                            "BurnCal: Turn each workout into an opportunity to burn bright.",
                                            "TrainWell: The effort you put in now builds your future self.",
                                            "MoveMore: Every step forward is a step toward a healthier you.",
                                            "StrongNow: Your strength is born from the determination within.",
                                            "PushLimits: Discover your potential by pushing past your perceived boundaries.",
                                            "JumpHigher: Leap into fitness with energy, enthusiasm, and determination.",
                                            "YogaLife: Connect body, mind, and soul on the mat of self-discovery.",
                                            "RowStrong: Row through challenges with resilience and determination.",
                                            "ZumbaFun: Dance your way to fitness, joy, and a healthier you.",
                                            "HIITLife: High-Intensity, Intentional Training for a life well-lived.",
                                            "FlexHard: Every flex is a testament to your commitment and strength.",
                                            "SpinFit: Pedal through challenges and discover the power within.",
                                            "PlankOn: A strong core supports not just your body but your dreams.",
                                            "JogFree: Feel the freedom in every step of your jogging journey.",
                                            "CoreFit: Strengthen your core, and you'll strengthen your entire self.",
                                            "BoxItOut: In the ring of life, face challenges and conquer them.",
                                            "BikeRide: Pedal through life with determination, joy, and adventure.",
                                            "SwimStrong: Dive into challenges with strength, grace, and resilience.",
                                            "HikeHigh: Ascend peaks, conquer trails, and embrace the outdoor adventure.",
                                            "DanceFit: Dance not just to the rhythm but to the beat of life.",
                                            "KickFit: Kick out doubts, kick in determination, and kickstart your journey.",
                                            "StretchNow: Flexibility in body, mind, and spirit leads to endless possibilities.",
                                            "GlowFit: Shine with health, radiance, and the positive energy of fitness."],
                                         listenerCount: 4.5,
                                         arrowToggle: false)
    
    static let playlists = [
        Playlist(name: "Sleep",
                 imageName: "sleep",
                 description: [
                    "Embrace the night's gentle embrace; sleep is the balm that heals and renews the spirit for a new day.",
                    "Soothe your soul in the cradle of night; sleep is the nightly rehearsal for a refreshed and brighter tomorrow.",
                    "Dreams are the whispered lullabies that gently guide us into the peaceful realm of rejuvenating sleep.",
                    "As the stars watch over, surrender to the peaceful embrace of sleep—the nightly ritual that renews mind and body.",
                    "In the quiet of the night, find solace in sleep's tender embrace, a sanctuary for rest and renewal.",
                    "Close your eyes, open the gateway to dreams. Sleep: the gentle journey to a world of tranquility and restoration.",
                    "Sleep is the silent healer, weaving dreams that mend the tapestry of a well-rested and rejuvenated life.",
                    "As the moonlight weaves through the curtains, let sleep unfold its magic—a nightly ritual of rest and renewal.",
                    "In the arms of night, surrender to sleep's embrace, where dreams are woven, and tomorrow is refreshed.",
                    "Sleep is the whisper of the night, inviting you to rest in the cradle of dreams and wake rejuvenated.",
                    "Release the day's echoes; enter the sanctuary of sleep, where dreams dance and tomorrow is reborn.",
                    "Night is the canvas, and sleep is the brush that paints dreams, bringing tranquility to the restless soul.",
                    "As the world quiets, let sleep serenade you into serenity—the nightly symphony of rest and rejuvenation.",
                    "Lay down the burdens of the day; let sleep weave a tapestry of dreams that rejuvenate the spirit overnight.",
                    "Sail into the sea of dreams, guided by the moon's gentle glow—a voyage into restful and replenishing sleep.",
                    "In the arms of night, surrender to sleep's sweet serenade—the restorative melody that echoes through tomorrow.",
                    "Let sleep be the night's embrace—a sanctuary where worries fade, dreams bloom, and energy is replenished.",
                    "Dreams are the stars that light up the night sky of sleep, guiding you to a peaceful and restful journey.",
                    "As the night unfolds, let sleep cradle you in its arms—a rejuvenating voyage into the heart of tranquility.",
                    "Sleep is the reset button of life—a nightly gift that restores, refreshes, and readies us for a new day.",
                    "In the silent hours, let sleep be your companion—an ally in the quest for a well-rested and serene tomorrow.",
                    "Dreams are the whispers of the night, carrying you into the arms of sleep—a haven of renewal and rejuvenation.",
                    "Surrender to sleep, where the worries of the day melt away, and dreams paint a canvas of serenity.",
                    "As the stars twinkle above, let sleep weave its magic—a silent symphony that renews and replenishes.",
                    "Sleep is the bridge between today and tomorrow—a voyage that restores, renews, and prepares for a new dawn.",
                    "Night whispers serenity; sleep responds with dreams—a healing partnership that rejuvenates the body and mind.",
                    "Embrace the night's tender hush, for sleep is the gentle conductor orchestrating dreams that rejuvenate and restore.",
                    "Let sleep be the lullaby of the night—a melody that cradles you into a realm of tranquility and renewal.",
                    "In the arms of night, find the serenity of sleep—a refuge where dreams mend and the spirit rejuvenates.",
                    "As the day surrenders to night, let sleep be your guide—a healing journey into the peaceful realm of dreams."],
                 listenerCount: 4.5,
                 arrowToggle: false),
        
        
        Playlist(name: "Meditation",
                 imageName: "meditate",
                 description: [
                    "Inhale peace, exhale chaos. Meditation: the art of finding stillness in the movement of life.",
                    "Breathe deeply. Let thoughts drift like clouds. In meditation, discover the serenity within your own silence.",
                    "Meditation: where the mind meets tranquility, and the soul reconnects with its eternal calm.",
                    "Calm your mind's storm with the gentle rain of mindfulness. Meditation is the umbrella of inner peace.",
                    "In the quiet of meditation, hear the whispers of your soul and feel the rhythm of universal harmony.",
                    "Sit in stillness. In the silence, discover the wisdom that arises from the quiet spaces within.",
                    "Meditation: the art of being present, embracing the now, and finding serenity in the present moment's embrace.",
                    "Breathe mindfully. In each inhale, collect calm; in each exhale, release chaos. Meditation: breath's gentle symphony.",
                    "Seek the sanctuary within. Meditation is the bridge that connects you to the tranquil haven of your inner self.",
                    "Mindfulness is a journey, and meditation is the compass that guides you into the heart of the present.",
                    "In the stillness of meditation, witness the dance of thoughts—observe, let go, return to the breath's gentle rhythm.",
                    "Close your eyes, open your heart. In meditation, explore the vast landscape of your inner world with awareness.",
                    "Meditation: a voyage into the depths of silence, where the soul's whispers become the guiding stars of tranquility.",
                    "With each breath, enter the sacred space of now. Meditation: a doorway to inner peace and mindfulness.",
                    "Meditate not to escape life but to embrace it fully—with a calm mind and an open heart.",
                    "In meditation, find solace in the present, as each breath anchors you in the serenity of now.",
                    "Meditation: a silent conversation with the universe, where the language is stillness, and the answers are whispers.",
                    "With every mindful breath, weave a tapestry of calm. Meditation is the loom of inner peace.",
                    "Discover the serenity beneath the waves of thought. In meditation, become the calm center of life's ever-changing storm.",
                    "Close your eyes, open your awareness. In meditation, observe the thoughts like passing clouds, leaving behind the sky of stillness.",
                    "Breathe in, breathe out. Meditation is the pause between breaths—a sanctuary where stillness speaks louder than words.",
                    "Meditation: where the mind's chaos transforms into the art of serene living—one breath, one moment at a time.",
                    "In the garden of silence, tend to the blossoms of peace. Meditation is the art of cultivating tranquility within.",
                    "Meditation: a mirror reflecting the calm within. Embrace the present, for it is where true serenity resides.",
                    "Let go of the river of thoughts. In meditation, become the silent observer, floating peacefully on the waters of awareness.",
                    "Pause. Breathe. In meditation, find the sacred rhythm of your own heartbeat—a symphony of peace within.",
                    "Meditation: a mindful journey where each step leads you deeper into the serene sanctuary of your own consciousness.",
                    "Breathe life's symphony. In meditation, attune your mind to the harmonious melodies of tranquility and inner calm.",
                    "Meditation: the art of mindful breathing, where each inhale brings peace, and each exhale releases tension.",
                    "In the silence of meditation, rediscover the language of the heart and the timeless serenity that resides within."],
                 listenerCount: 4.5,
                 arrowToggle: false),
        
        Playlist(name: "Motivation",
                 imageName: "motivation",
                 description: [
                    "Craft your life story with purpose, ensuring every chapter is an inspiration to those who read it.",
                    "Great work stems from a deep love for what you do. Passion fuels the journey to excellence.",
                    "Your attitude isn't just a response; it's a compass guiding the direction of your life's narrative.",
                    "Dream beyond boundaries, toil persistently, and keep your focus unwavering for a life rich in achievement.",
                    "Life's equation: 10% events, 90% reactions. Master the art of responding positively to shape your destiny.",
                    "The future is a canvas; believe in the beauty of your dreams and paint a masterpiece of possibility. - Eleanor Roosevelt",
                    "Belief is the engine that propels us forward. Half the journey is covered when you truly believe. - Theodore Roosevelt",
                    "The realization of tomorrow depends largely on our confidence today. Banish doubts to create your destiny. - Franklin D. Roosevelt",
                    "In the brevity of life, infuse sweetness. Make each moment a melody that resonates with joy and fulfillment.",
                    "Chase your dreams relentlessly, but let the path always lead you back to the warmth of a loving home.",
                    "The key to creating a remarkable future lies in the unwavering belief in the potential of your dreams.",
                    "Success is transient, failure isn't fatal; it's the courage to persist that truly defines your journey. - Winston S. Churchill",
                    "Goals are stepping stones, but the transformation during the journey is the real treasure. - Zig Ziglar",
                    "The stories we tell ourselves shape our reality. Break free from limiting narratives and embrace possibility. - Jordan Belfort",
                    "Life unfolds, a blend of events and responses. Choose positivity, for in that choice, true living is found.",
                    "Time is a river, not a clock. Immerse yourself in the flow, and progress will be your constant companion.",
                    "Embark on the journey, for the impossible is an illusion shattered only by the pursuit of one's aspirations.",
                    "Happiness isn't serendipity; it's a conscious choice, a product of how you navigate life's landscape.",
                    "Every moment is a choice; choose to live authentically, not dictated by the expectations of others. - Steve Jobs",
                    "Don't be a spectator in your life; be the director. Guide your narrative with intention and purpose.",
                    "Rise above the fears echoing in your mind. Follow the dreams resonating in your heart.",
                    "Let your life be a testament to the change you wish to witness in the world. - Mahatma Gandhi",
                    "Life's journey encompasses rough terrains and comfortable abodes. Embrace both, for they shape your character.",
                    "Life's purpose transcends mere accumulation. Impact, not income, defines a truly meaningful existence. - Kevin Kruse",
                    "Love what you do, and work will cease to be a chore. Passion transforms labor into an art.",
                    "Don't tally the days; make each day count. It's not about quantity but the quality of moments. - Muhammad Ali",
                    "Persistence is the architect of achievement. The harder the effort, the more profound the sense of accomplishment.",
                    "Create your future rather than predict it. Each decision, action, and effort is a brushstroke on the canvas of tomorrow. - Peter Drucker",
                    "Dreams are the soul's poetry. Believe in their beauty and let them dance across the landscape of your life. - Eleanor Roosevelt",
                    "In the brevity of life, infuse sweetness. Make each moment a melody that resonates with joy and fulfillment."],
                 listenerCount: 4.5,
                 arrowToggle: false),
        
        Playlist(name: "Study",
                 imageName: "study",
                 description: [
                    "Study diligently; knowledge is the compass guiding you through the vast terrain of endless possibilities and growth.",
                    "Every study session plants seeds of wisdom, cultivating a harvest of knowledge that shapes your future success.",
                    "In the library of learning, each book is a stepping stone toward a brighter, more enlightened tomorrow.",
                    "Study is the bridge between ignorance and understanding, crossing it leads to the shores of wisdom and enlightenment.",
                    "Knowledge is the currency of success; invest your time wisely in the study to reap the dividends of wisdom.",
                    "Books are mentors; study them to gain insights that propel you toward excellence and a brighter future.",
                    "Unlock the door to success with the key of study, embracing each lesson as a stairway to your goals.",
                    "In the quiet of study, hear the whispers of wisdom, guiding you toward mastery and self-discovery.",
                    "Study is the sculptor's tool, shaping your intellect and carving the pathway to academic and personal triumph.",
                    "Every page turned is a step taken on the journey to knowledge—a pilgrimage that transforms and enlightens.",
                    "Mindful study is the compass steering you through the labyrinth of information, leading to mastery and understanding.",
                    "Knowledge blooms in the garden of study; tend to it, and watch the flowers of wisdom flourish.",
                    "Study is the architect of intellect, constructing a foundation that supports the grand structure of lifelong learning.",
                    "In the laboratory of study, experiments with knowledge yield discoveries that illuminate the corridors of wisdom.",
                    "Study is the orchestra, each note a concept, together creating a symphony of understanding and brilliance.",
                    "Unlock the treasure chest of knowledge through diligent study—a key that opens the door to boundless opportunities.",
                    "In the library of life, study is the librarian, organizing the volumes that shape your journey to success.",
                    "Study: the silent mentor, imparting lessons that echo through the corridors of your academic and personal endeavors.",
                    "Knowledge grows with each chapter studied; cultivate it, and watch your intellectual garden flourish with brilliance.",
                    "Study is the compass guiding your intellectual journey; let it be the North Star that leads you to success.",
                    "In the alchemy of study, turn the pages of books into the gold of knowledge, forging a prosperous future.",
                    "Study is the architect, and diligence is the blueprint, designing a structure of wisdom and accomplishment.",
                    "Study with purpose; each moment spent learning is a brick laid in the construction of your successful future.",
                    "Books are the silent mentors in the academy of study, imparting timeless wisdom that echoes through the ages.",
                    "In the gallery of intellect, study is the curator, arranging the masterpieces of knowledge that shape your brilliance.",
                    "Study: the key that unlocks the door to a realm of understanding, guiding you to mastery and enlightenment.",
                    "Knowledge is the treasure map, and study is the journey that leads you to the chest of intellectual wealth.",
                    "Each equation solved, each concept grasped is a victory on the battlefield of study, conquering ignorance with wisdom.",
                    "Study is the weaver, intertwining threads of information into the tapestry of comprehension and academic triumph.",
                    "In the mosaic of learning, each study session is a vibrant tile, contributing to the masterpiece of wisdom."],
                 listenerCount: 4.5,
                 arrowToggle: false),
        
        Playlist(name: "Fitness",
                 imageName: "fitness",
                 description: [
                    "EmbraceFit: Your journey to a healthier, stronger, and happier you!",
                    "RunStrong: Every step you take brings you closer to greatness.",
                    "LiftHeavy: Elevate not just weights but also your strength within.",
                    "GymLife: Where dedication shapes the body and molds the spirit.",
                    "SweatItOut: The path to success is paved with hard work.",
                    "ActiveLife: Seize each moment to move, play, and thrive.",
                    "GoHarder: Challenge yourself, break limits, and redefine your potential.",
                    "BurnCal: Turn each workout into an opportunity to burn bright.",
                    "TrainWell: The effort you put in now builds your future self.",
                    "MoveMore: Every step forward is a step toward a healthier you.",
                    "StrongNow: Your strength is born from the determination within.",
                    "PushLimits: Discover your potential by pushing past your perceived boundaries.",
                    "JumpHigher: Leap into fitness with energy, enthusiasm, and determination.",
                    "YogaLife: Connect body, mind, and soul on the mat of self-discovery.",
                    "RowStrong: Row through challenges with resilience and determination.",
                    "ZumbaFun: Dance your way to fitness, joy, and a healthier you.",
                    "HIITLife: High-Intensity, Intentional Training for a life well-lived.",
                    "FlexHard: Every flex is a testament to your commitment and strength.",
                    "SpinFit: Pedal through challenges and discover the power within.",
                    "PlankOn: A strong core supports not just your body but your dreams.",
                    "JogFree: Feel the freedom in every step of your jogging journey.",
                    "CoreFit: Strengthen your core, and you'll strengthen your entire self.",
                    "BoxItOut: In the ring of life, face challenges and conquer them.",
                    "BikeRide: Pedal through life with determination, joy, and adventure.",
                    "SwimStrong: Dive into challenges with strength, grace, and resilience.",
                    "HikeHigh: Ascend peaks, conquer trails, and embrace the outdoor adventure.",
                    "DanceFit: Dance not just to the rhythm but to the beat of life.",
                    "KickFit: Kick out doubts, kick in determination, and kickstart your journey.",
                    "StretchNow: Flexibility in body, mind, and spirit leads to endless possibilities.",
                    "GlowFit: Shine with health, radiance, and the positive energy of fitness."],
                 listenerCount: 4.5,
                 arrowToggle: false),
        
        Playlist(name: "Explore more",
                 imageName: "ic_explore_more",
                 description: [""],
                 listenerCount: 4.5,
                 arrowToggle: false)
    ]
}
