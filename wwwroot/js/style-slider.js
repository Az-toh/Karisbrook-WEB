{let strip = document.getElementById("asd_strip")
let count = 0
let width = 244.2

function asd_swipe(dir) {
	if (dir === 0) {
		count--
		if (count < 0) count = 3
	}else{
		count++
		if (count > 3) count = 0
	}
	strip.style.transform = `translateX(-${count*width}px)` 
} 
}

{let strip = document.getElementById("asd_strip_3")
let count = 0
let width = 244.2

function asd_swipe_3(dir) {
	if (dir === 0) {
		count--
		if (count < 0) count = 3
	}else{
		count++
		if (count > 3) count = 0
	}
	strip.style.transform = `translateX(-${count*width}px)` 
} 
}

{let strip = document.getElementById("asd_strip_4")
let count = 0
let width = 244.2

function asd_swipe_4(dir) {
	if (dir === 0) {
		count--
		if (count < 0) count = 3
	}else{
		count++
		if (count > 3) count = 0
	}
	strip.style.transform = `translateX(-${count*width}px)` 
} 
}

{let strip = document.getElementById("asd_strip_1")
let count = 0
let width = 286

function asd_swipe_1(dir){
	if (dir === 0) {
		count--
		if (count < 0) count = 2
	}else{
		count++
		if (count > 2) count = 0
	}
	strip.style.transform = `translateX(-${count*width}px)` 
}
}

{let strip = document.getElementById("asd_strip_2")
let count = 0
let width = 250

function asd_swipe_2(dir){
	if (dir === 0) {
		count--
		if (count < 0) count = 5
	}else{
		count++
		if (count > 5) count = 0
	}
	strip.style.transform = `translateX(-${count*width}px)` 
}
}


