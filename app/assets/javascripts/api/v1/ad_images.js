var AdImage;

AdImage = (function (){
	'use strict';
	var init, bind;
	var getAdImage;
	var url;

	init = function () {
		url = "/api/v1/ad_images";
	};
	getAdImage = function (class_name) {
		$(class_name).each(function(image_container) {
			var that = this;
			var imageId = $(that).data('image-id');
			if (imageId !== "undefined") {
				$.ajax({
					url: url + "/"+imageId,
					success: function (data) {
						var image_url = "data:"+data.mimetype+";base64,"+data.bindaryData
						$(that).css('background-image', "url("+image_url+")")
					},
					error: function () {
						console.log('no se pudo obtener la imagen');
					}
				});
			}
		});
		/*$.ajax({
			url: url + "/"+image_id,
			success: function (data) {
				var image_url = "data:"+data.mimetype+";base64,"+data.bindaryData
				$.each(ids, function(idx, value) { 
					$(elem+"[data-product-id="+value+"]").css('background-image', "url("+image_url+")")
				});
			},
			error: function () {
				console.log('no se pudo obtener la imagen');
			}
		});*/
	};
	return {
		init: init,
		getAdImage: getAdImage
	};
}());


//There is an example in how implement this
/*$(document).on('ready', function () {
	AdImage.init();
	AdImage.getAdImage("FCA42C3E8A684B72AC00854C4243859B", ".img-bonitas", ["1","2"]);
});*/