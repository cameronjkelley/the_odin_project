var my_max = function(ary) {
	var max = 0;
	for (var i = 0; i < ary.length; i ++) {
		if (ary[i] > max) {
			max = ary[i];
		}
	}
	return max;
};

var vowel_count = function(str) {
	var vowels = ["a", "e", "i", "o", "u", "y"]
		count = 0;
		for (var i = 0; i < str.length; i++) {
			if (vowels.indexOf(str[i].toLowerCase()) !== -1) {
				count += 1;
			}
		}
	return count;
};

var reverse = function(str) {
	var reverse = "";
	for (var i = 0; i < str.length; i++) {
		reverse += str[i];
	}
	return reverse;
};