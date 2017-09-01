<%@ include file="/init.jsp" %>

<div class="conciliation">
	<textarea id="fulltext"></textarea>
	<div id="output"></div>
<div>

<script type="text/javascript">

countWords = function(words, text) {

		var a = words.split(","),
				i,
				wordsTotal = 0;

		for (i = 0; i < a.length; i++) {
			var wordMatch = a[i];
			var count = 0;
			var words = text.split(' ');
			for (x in words) {
					if (words[x].toLowerCase() == wordMatch) {
							count++;
					}
			}
			wordsTotal = wordsTotal + count;
		}


    return wordsTotal;
}

findWord = function() {
    var outputDiv = $('#output');
    var searchText = $('#fulltext').val();
    var plusMatch = 'roubo,furto,vizinho,bebe,mae,dormingo,noite,briga,puto,puta';
		var minusMatch = 'tudo';

		outputDiv.empty();

		var plusTotal = countWords(plusMatch, searchText);
		var minusTotal = countWords(minusMatch, searchText);
		console.log(plusTotal);
		console.log(minusTotal);


    outputDiv.append('<div>Danos materiais: ' + ((plusTotal * 500) - (minusTotal * 500)) + '</div>');
		outputDiv.append('<div>Danos morais: ' + ((plusTotal * 250) - (minusTotal * 250)) + '</div>');
}


$(document).ready(function() {
    $('#fulltext').change(findWord);
    $('#fulltext').keydown(findWord);
    $('#fulltext').keypress(findWord);
    $('#fulltext').keyup(findWord);
    $('#fulltext').blur(findWord);
    $('#fulltext').focus(findWord);
});
</script>