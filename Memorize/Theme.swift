//
//  Theme.swift
//  Memorize
//
//  Created by Brio Taliaferro on 14.10.22.
//

import Foundation

struct Theme<CardContent> {
	let emojis: [CardContent]
	let colorCode: String
	let name: String
	let numberOfPairs: Int
	
	var availablePairs: Int {
		min(emojis.count, numberOfPairs)
	}
}

extension Theme {
	static var emojiThemes: [Theme<String>] {
		[
			Theme<String>(emojis: ["✈️","🚋","🛵","🛳","🚗","🚕","🚌","🚎","🚔","🚍","🚘","🚖"].shuffled(),
				  colorCode: "red", name: "Traffic", numberOfPairs: 5),
			Theme<String>(emojis: ["🍏","🍎","🍐","🍊","🍋","🍌","🍉","🍇","🍓","🫐","🍍","🥝"].shuffled(),
				  colorCode: "green", name: "Fruit", numberOfPairs: 12),
			Theme<String>(emojis: ["🐶","🐭","🐰","🦊","🐻","🐼","🐷","🐸","🐔","🦉","🦆","🦋"].shuffled(),
				  colorCode: "blue", name: "Animals", numberOfPairs: 17)
		]
	}
}
