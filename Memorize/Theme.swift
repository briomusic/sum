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
			Theme<String>(emojis: ["✈️","🚋","🛵","🛳","🚗","🚕","🚌","🚎","🚔","🚍","🚘","🚖"],
				  colorCode: "red", name: "Traffic", numberOfPairs: 5),
			Theme<String>(emojis: ["🍏","🍎","🍐","🍊","🍋","🍌","🍉","🍇","🍓","🫐","🍍","🥝"],
				  colorCode: "green", name: "Fruit", numberOfPairs: 5),
			Theme<String>(emojis: ["🐶","🐭","🐰","🦊","🐻","🐼","🐷","🐸","🐔","🦉","🦆","🦋"],
				  colorCode: "blue", name: "Animals", numberOfPairs: 5)
		]
	}
}
