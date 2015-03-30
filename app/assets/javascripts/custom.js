$(document).ready(function(){
	function showBySearchTerm(listLinks, searchMatch){
		listLinks.each(function (index, element){
			if($(element).text().match(searchMatch)) {
				$(element).show();
			} else {
				$(element).hide();
			}
		});
	}

	$('#filter-urls').click(function(){
		var filterBy = $('#original_url').val()
		var $listLinks = $('.all-links tbody tr')
		var searchMatch = new RegExp(filterBy, "i")
		showBySearchTerm($listLinks, searchMatch);
	});
});
