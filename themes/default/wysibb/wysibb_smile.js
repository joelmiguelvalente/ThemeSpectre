function smiles_mod_plu() {
	$.ajax({
		type: 'post',
		url: global_data.url + '/emoticones-load.php',
		success: function(h) {
			$('#wybbsmile').html(h);
		}
	});
}	