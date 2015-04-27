//
//  MainScene.swift
//  AlexStudnicka
//
//  Created by Alex Studnicka on 25/04/15.
//  Copyright (c) 2015 Alex Studnicka. All rights reserved.
//

import UIKit
import SceneKit

class MainScene: ScrollScene {
	
	// MARK: - Getters
	
	override func getItemsCount() -> Int {
		return 5
	}
	
	override func getTitle(i: Int) -> String {
		if i >= getItemsCount() { return "" }
		return ["About Me", "My Story", "WWDC", "My Apps", "Other"][i]
	}
	
	override func getImage(i: Int) -> String {
		if i >= getItemsCount() { return "" }
		return ["about", "story", "wwdc", "icon_guides", "more"][i]
	}
	
	// MARK: - Setup
	
	override func initSetup() {
		super.initSetup()
		
		let textNode = makeTextNode("Hi! Scroll trough the menu\nbelow and select category", size: 34)
		textNode.position.y += 150
		rootNode.addChildNode(textNode)
		
	}
	
	// MARK: - UITapGestureRecognizer
	
	override func itemTapped(i: Int) {
		switch i {
		case 0:
			delegate.setScene(AboutScene.self)
		case 1:
			delegate.setScene(StoryScene.self)
		case 2:
			delegate.setScene(WWDCScene.self)
		case 3:
			delegate.setScene(AppsScene.self)
		case 4:
			delegate.setScene(OtherScene.self)
		default:
			break
		}
	}
	
}
