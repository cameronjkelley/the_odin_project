var total = null,
	operand = "",
	operator;

$(document).ready(function() {
	display(0);
});

$(".number").click(function() {
	operand += $.trim($(this).text());
	display(operand);
});

$(".operator").click(function() {
	operator = $.trim($(this).text());
	if (total === null) {
		total = operand;
		operand = "";
	}
});

$("#equals-btn").click(function() {
	if (total != null) {
		var a = parseInt(total),
			b = parseInt(operand);
		switch(operator) {
			case "+":
				total = adding(a, b);
				break;
			case "-":
				total = subtracting(a, b);
				break;
			case "*": 
				total = multiplying(a, b)
				break;
			case "/":
				total = dividing(a, b);
				break;
		}
		display(total);
		operand = "";
	}
});

$("#clear-btn").click(function() {
	clear();
});

function adding(a, b) {
	return a + b;
};

function subtracting(a, b) {
	return a - b;
};

function multiplying(a, b) {
	return a * b;
};

function dividing(a, b) {
	return a / b;
};

function clear() {
	total = null, operand = "", operator = "";
	display(0);
};

function display(x) {
	$("#display").html(x);
};