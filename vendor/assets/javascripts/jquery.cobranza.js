/*
 Carrito 1.0.0
 Copyright (c) 2012 Julio Pérez(jperez@tegik.com)
 OTHER DEALINGS IN THE SOFTWARE.
 */
(function ($, undefined) {
    var Cobranza = function () {

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
            //document.getElementById("car_pro").innerHTML = '<div align="center"><strong> Carrito VACIO</strong></div>';
            document.getElementById("car_pro").innerHTML = '<br><br><br><br><br><div align="center" id="loader-wrapper"><img src="load.gif" height="9%" width="6%"></img></div>';
        };
        priv.setData = function (pData) {
            priv.drawCar(pData);
        };
        priv.drawCbnza = function (datos) {
            console.log("Pintar Listado de Documentos", datos);
            
        };
        priv.separaMiles = function(numero) {
            numero = numero.toString();
            var resultado = "";            
            if(numero[0]=="-")
            {
                nuevoNumero=numero.replace(/\,/g,'').substring(1);
            }else{
                nuevoNumero=numero.replace(/\,/g,'');
            }
            
            if(numero.indexOf(".")>=0)
                nuevoNumero=nuevoNumero.substring(0,nuevoNumero.indexOf("."));

            for (var j, i = nuevoNumero.length - 1, j = 0; i >= 0; i--, j++) 
                resultado = nuevoNumero.charAt(i) + ((j > 0) && (j % 3 == 0)? ",": "") + resultado; 
            if(numero.indexOf(".")>=0)
                resultado+=numero.substring(numero.indexOf("."), numero.indexOf(".")+3);

            if(numero[0]=="-")
            {
                return "-"+resultado;
            }else{
                return resultado;
            }
        };
        /* Public API
         *************************************************************************/
        publ.setData = function (data) {
            console.log("Public Set Data");
            priv.setData(data);
            return publ;
        };

        publ.init = function (koalas) {
            //merge supplied options with defaults
            $.extend(priv.options, defaults, koalas);
            priv.init();
            return publ;
        };
        publ.drawFiltros = function(pData){
            console.log("Crear Filtros", pData);

        };

        return publ;
    };

    $.fn.Cobranza = function (koalas) {
        koalas = koalas || {};
        return this.each(function () {
            koalas.id = this;
            $(this).data('Carrito', new Carrito().init(koalas));
        });
    };
})(jQuery);  


    function separaMiles(numero){ 
        // Variable que contendra el resultado final
        var resultado = "";
        
        // Si el numero empieza por el valor "-" (numero negativo)
        if(numero[0]=="-")
        {
            // Cogemos el numero eliminando los posibles puntos que tenga, y sin
            // el signo negativo
            nuevoNumero=numero.replace(/\,/g,'').substring(1);
        }else{
            // Cogemos el numero eliminando los posibles puntos que tenga
            nuevoNumero=numero.replace(/\,/g,'');
        }
        
        // Si tiene decimales, se los quitamos al numero
        if(numero.indexOf(".")>=0)
            nuevoNumero=nuevoNumero.substring(0,nuevoNumero.indexOf("."));

        // Ponemos un punto cada 3 caracteres
        for (var j, i = nuevoNumero.length - 1, j = 0; i >= 0; i--, j++) 
            resultado = nuevoNumero.charAt(i) + ((j > 0) && (j % 3 == 0)? ",": "") + resultado; 
        
        // Si tiene decimales, se lo añadimos al numero una vez forateado con 
        // los separadores de miles
        if(numero.indexOf(".")>=0)
            resultado+=numero.substring(numero.indexOf("."), numero.indexOf(".")+3);

        if(numero[0]=="-")
        {
            // Devolvemos el valor añadiendo al inicio el signo negativo
            return "-"+resultado;
        }else{
            return resultado;
        }
    }
    function buildAlert(titulo, mensaje){
            return '<div id="alert_limite" class="alert alert-danger alert-dismissible fade in" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4>'+titulo+'</h4><p>'+mensaje+'</p></div>';
    }