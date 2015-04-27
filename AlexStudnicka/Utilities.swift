//
//  Utilities.swift
//  nogol
//
//  Created by Alex Studnicka on 21/03/15.
//  Copyright (c) 2015 Nogol. All rights reserved.
//

import Foundation
import UIKit
import SceneKit

func calcCenter(index: Int, total: Int, outRadius: Double, inRadius: Double, start: Double) -> (x: Float, y: Float) {
	var x = outRadius/2
	var y = x
	let i = Double(index)
	let t = Double(total)
	let r = inRadius
	let a = -(i * (2 * M_PI / t)) - M_PI_2 + start
	x += r * cos(a)
	y += r * sin(a)
	return (x: Float(x), y: Float(y))
}

func makeTextNode(text: String, size: Float = 50) -> SCNNode {
	let text = SCNText(string: text, extrusionDepth: 2)
	text.font = UIFont(name: "Helvetica", size: CGFloat(size))
	text.firstMaterial!.emission.contents = UIColor.whiteColor()
	let textNode = SCNNode(geometry: text)
	var v1 = SCNVector3Zero, v2 = SCNVector3Zero
	textNode.getBoundingBoxMin(&v1, max: &v2)
	let dx: Float = Float(v1.x - v2.x)/2.0
	let dy: Float = Float(v1.y - v2.y)
	textNode.position = SCNVector3Make(dx, dy+350, 0)
	return textNode
}

func Deg2Rad(value: Double) -> Double {
	return value * M_PI / 180.0
}

func Deg2RadF(value: Float) -> Float {
	return Float(Deg2Rad(Double(value)))
}

func Rad2Deg(value: Double) -> Double {
	return value * 180.0 / M_PI
}

func Rad2DegF(value: Float) -> Float {
	return Float(Rad2Deg(Double(value)))
}
