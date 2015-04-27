//
//  SlidesScene.swift
//  AlexStudnicka
//
//  Created by Alex Studnicka on 19/04/15.
//  Copyright (c) 2015 Alex Studnicka. All rights reserved.
//

import UIKit
import SceneKit

let CHANGE_SLIDE_DURATION = 0.5

class SlidesScene: Scene {
	
	var slides = [SCNNode]()
	var currentSlideNum = 0
	
	var gestureImageView: UIImageView?
	
	// MARK: - Setup
	
	override func initSetup() {
		
		if !AppDelegate.instance.swipeGestureShowed {
			gestureImageView = UIImageView()
			gestureImageView!.frame = CGRect(x: 20+200, y: 144+200, width: 64, height: 64);
			gestureImageView!.image = UIImage(named: "Swipe_Left")
			rootView.addSubview(gestureImageView!)
			AppDelegate.instance.swipeGestureShowed = true
		}
		
		// --------
		
		let lightNode = SCNNode()
		lightNode.light = SCNLight()
		lightNode.light!.type = SCNLightTypeOmni
		lightNode.position = SCNVector3(x: 0, y: 700, z: 700)
		lightNode.eulerAngles = SCNVector3(x: Float(-M_PI/4), y: 0, z: 0)
		rootNode.addChildNode(lightNode)
		
		let ambientLightNode = SCNNode()
		ambientLightNode.light = SCNLight()
		ambientLightNode.light!.type = SCNLightTypeAmbient
		ambientLightNode.light!.color = UIColor.darkGrayColor()
		rootNode.addChildNode(ambientLightNode)
		
		let floor = SCNFloor()
		let floorNode = SCNNode(geometry: floor)
		floor.firstMaterial = SCNMaterial()
		floor.firstMaterial!.diffuse.contents = UIColor.lightGrayColor()
		rootNode.addChildNode(floorNode)
		
	}
	
	override func setupScene(view: SCNView, cameraNode: SCNNode, animated: Bool) {
		super.setupScene(view, cameraNode: cameraNode, animated: animated)
		
		cameraNode.runAction(SCNAction.group([
			SCNAction.moveTo(SCNVector3(x: 0, y: 100, z: 600), duration: (animated ? 0.3 : 0)),
			SCNAction.rotateToX(0, y: 0, z: 0, duration: (animated ? 0.3 : 0))
		]))
	}
	
	// MARK: - UITapGestureRecognizer
	
	override func handleTap(hitResults: [SCNHitTestResult]) {
		changeSlide(1)
	}
	
	// MARK: - UIPanGestureRecognizer
	
	override func handlePan(gestureRecognizer: UIPanGestureRecognizer) {
		
		switch gestureRecognizer.state {
		case .Changed:
			
			let curPanX = gestureRecognizer.translationInView(rootView).x
			if abs(curPanX) > 50 {
				if curPanX < 0 {
					changeSlide(1)
				} else {
					changeSlide(-1)
				}
				gestureRecognizer.enabled = false
			}
			
		default:
			break
		}
		
		if gestureRecognizer.state == .Cancelled {
			gestureRecognizer.enabled = true
		}
		
	}
	
	// MARK: - Utilities
	
	func changeSlide(i: Int) {
		if currentSlideNum+i >= count(slides) || currentSlideNum+i < 0 {
			delegate.setScene(MainScene.self)
		} else {
			let currentSlide = slides[currentSlideNum] as SCNNode
			let nextSlide = slides[currentSlideNum+i] as SCNNode
			
			nextSlide.opacity = 0
			rootNode.addChildNode(nextSlide)
			
			if i < 0 {
				nextSlide.position.x = -1000
				nextSlide.eulerAngles.z = Float(-M_PI_4)
				currentSlide.runAction(SCNAction.sequence([SCNAction.group([SCNAction.moveByX(1000, y: 0, z: 0, duration: CHANGE_SLIDE_DURATION), SCNAction.rotateByX(0, y: 0, z: CGFloat(M_PI_4), duration: CHANGE_SLIDE_DURATION), SCNAction.fadeOutWithDuration(CHANGE_SLIDE_DURATION)]), SCNAction.removeFromParentNode()]))
				nextSlide.runAction(SCNAction.group([SCNAction.moveByX(1000, y: 0, z: 0, duration: CHANGE_SLIDE_DURATION), SCNAction.rotateByX(0, y: 0, z: CGFloat(M_PI_4), duration: CHANGE_SLIDE_DURATION), SCNAction.fadeInWithDuration(CHANGE_SLIDE_DURATION)]))
			} else {
				nextSlide.position.x = 1000
				nextSlide.eulerAngles.z = Float(M_PI_4)
				currentSlide.runAction(SCNAction.sequence([SCNAction.group([SCNAction.moveByX(-1000, y: 0, z: 0, duration: CHANGE_SLIDE_DURATION), SCNAction.rotateByX(0, y: 0, z: CGFloat(-M_PI_4), duration: CHANGE_SLIDE_DURATION), SCNAction.fadeOutWithDuration(CHANGE_SLIDE_DURATION)]), SCNAction.removeFromParentNode()]))
				nextSlide.runAction(SCNAction.group([SCNAction.moveByX(-1000, y: 0, z: 0, duration: CHANGE_SLIDE_DURATION), SCNAction.rotateByX(0, y: 0, z: CGFloat(-M_PI_4), duration: CHANGE_SLIDE_DURATION), SCNAction.fadeInWithDuration(CHANGE_SLIDE_DURATION)]))
			}
			
			currentSlideNum += i
		}
		
		if let _gestureImageView = gestureImageView {
			UIView.animateWithDuration(CHANGE_SLIDE_DURATION, animations: {
				_gestureImageView.alpha = 0
			}) { _ in
				_gestureImageView.removeFromSuperview()
				self.gestureImageView = nil
			}
		}
	}
	
}
