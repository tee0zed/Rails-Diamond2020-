# encoding: utf-8

eyes = File.open("./eyes.txt", "r") {|f| f.readlines}

foreheads = File.open("./forehead.txt", "r") {|f| f.readlines}

noses = File.open("./noses.txt", "r") {|f| f.readlines}

mouths = File.open("./mouths.txt", "r") {|f| f.readlines}

array = [foreheads, eyes, noses, mouths]

array.each {|var| puts var.sample}
