//
//  Scene.swift
//  AlexStudnicka
//
//  Created by Alex Studnicka on 15/04/15.
//  Copyright (c) 2015 Alex Studnicka. All rights reserved.
//

import UIKit
import SceneKit

let ANIMATION_DURATION = 0.3
let ROTATION_DURATION = 1.2

protocol SceneDelegate {
	func setScene(sceneClass: Scene.Type)
}

class Scene: NSObject, SCNSceneRendererDelegate {
	
	let delegate: SceneDelegate
	let rootNode = SCNNode()
	var cameraNode: SCNNode!
	let rootView = UIView()
	
	// MARK: - Init
	
	required init(delegate: SceneDelegate) {
		self.delegate = delegate
		super.init()
		initSetup()
	}
	
	// MARK: - Setup
	
	func initSetup() { }
	
	func setupScene(view: SCNView, cameraNode: SCNNode, animated: Bool) {
		self.cameraNode = cameraNode
		
		if animated {
			rootView.alpha = 0
			rootNode.opacity = 0
		}
		
		view.addSubview(rootView)
		view.scene!.rootNode.addChildNode(rootNode)
		
		if animated {
			UIView.animateWithDuration(ANIMATION_DURATION) {
				self.rootView.alpha = 1
			}
			rootNode.runAction(SCNAction.fadeInWithDuration(ANIMATION_DURATION))
		}
	}
	
	func teardownScene(animated: Bool, completion: () -> ()) {
		
		if animated {
			UIView.animateWithDuration(ANIMATION_DURATION, animations: {
				self.rootView.alpha = 0
			}, completion: { complete in
				self.rootView.removeFromSuperview()
				completion()
			})
			
			rootNode.runAction(SCNAction.sequence([SCNAction.fadeOutWithDuration(ANIMATION_DURATION), SCNAction.removeFromParentNode()]))
		} else {
			rootView.removeFromSuperview()
			rootNode.removeFromParentNode()
			completion()
		}
		
	}
	
	// MARK: - UITapGestureRecognizer
	
	func handleTap(hitResults: [SCNHitTestResult]) { }
	
	// MARK: - UIPanGestureRecognizer
	
	func handlePan(gestureRecognize: UIPanGestureRecognizer) { }
	
	// MARK: - SCNSceneRendererDelegate
	
	func renderer(aRenderer: SCNSceneRenderer, updateAtTime time: NSTimeInterval) { }
	
}
