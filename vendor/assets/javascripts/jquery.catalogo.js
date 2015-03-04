/*
 Catalogo 1.0.0
 Copyright (c) 2012 Julio Pérez(jperez@tegik.com)
 OTHER DEALINGS IN THE SOFTWARE.
 */
(function ($, undefined) {
    var Catalogo = function () {

        var priv = {}; //private api
        var publ = {}; //public api

        priv.options = {};
        priv.koalas = "koalasass";
        var defaults = {
            url: ''
        };

        /*
         initialize the plugin.
         */
        priv.init = function () {
            document.getElementById("cat_pro").innerHTML = '<div align="center"><strong> CATALOGO VACIO</strong></div>';
        };
        priv.setData = function (pData) {
            priv.drawCat(pData);
        };
        priv.drawCat = function (pData) {
            console.log("DrawCato -- ");
            var jsonCols = pData.cols;
            var jsonRows = pData.rows;
            var search = '<div class="input-group"><span class="input-group-addon glyphicon glyphicon-search"></span><input type="text" class="form-control btn_search" aria-describedby="basic-addon1" id="txt_search"></div>';
            var tabla = search + '<div width="100%">';
            console.log("$>" + tabla);
            for (var key in jsonRows) {
                var obj = jsonRows[key]; 
                if (obj.Nombre != undefined) {
                    tabla += '<a href="javascript:agregar();"><div class="item" style="background-image: url('+obj.Image+');">' + obj.Nombre + '</div></a>';
                }
            }
            tabla += "</div>";
            document.getElementById("cat_pro").innerHTML = tabla;
        };

        /* Public API
         *************************************************************************/
        publ.setData = function (data) {
            console.log("pasa por aca 1");
            priv.setData(data);
            return publ;
        };

        publ.init = function (koalas) {
            //merge supplied options with defaults
            $.extend(priv.options, defaults, koalas);
            priv.init();
            return publ;
        };
        return publ;
    };
    $.fn.Catalogo = function (koalas) {
        koalas = koalas || {};
        return this.each(function () {
            koalas.id = this;
            $(this).data('Catalogo', new Catalogo().init(koalas));
        });
    };
})(jQuery);  
   function agregar(){
    confirmar=confirm("Agregar al carrito?");
    if (confirmar){
        alert("Producto agregado correctamente puedes modificar la cantidad ingresando al carrito.");
    }

  }