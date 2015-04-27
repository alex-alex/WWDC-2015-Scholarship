//
//  AppScene.swift
//  AlexStudnicka
//
//  Created by Alex Studnicka on 26/04/15.
//  Copyright (c) 2015 Alex Studnicka. All rights reserved.
//

class AppScene: SlidesScene {
	
	// MARK: - Utilities
	
	override func changeSlide(i: Int) {
		if currentSlideNum+i >= count(slides) || currentSlideNum+i < 0 {
			delegate.setScene(AppsScene.self)
		} else {
			super.changeSlide(i)
		}
	}

}
