var AdImage;

AdImage = (function (){
	'use strict';
	var init, bind;
	var getAdImage;
	var url;

	init = function () {
		url = "/api/v1/ad_images";
	};
	getAdImage = function (image_id, elem, ids) {

		$.ajax({
			url: url + "/"+image_id,
			success: function (data) {
				var image_url = "data:"+data.mimetype+";base64,"+data.bindaryData
				$.each(ids, function(idx, value) { 
					$(elem+"[data-product-id="+value+"]").css('background', "url("+image_url+")")
				});
			},
			error: function () {
				console.log('no se pudo obtener la imagen');
			}
		});
	};
	return {
		init: init,
		getAdImage: getAdImage
	};
}());


//There is an example in how implement this
/*AdImage.init();
AdImage.getAdImage("FCA42C3E8A684B72AC00854C4243859B", ".img-bonitas", ["1","2"]);
*/