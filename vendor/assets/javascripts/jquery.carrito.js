/*
 Carrito 1.0.0
 Copyright (c) 2012 Julio Pérez(jperez@tegik.com)
 OTHER DEALINGS IN THE SOFTWARE.
 */
(function ($, undefined) {
    var Carrito = function () {

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
        priv.drawCar = function (datos) {
            console.log("Pintar Carrito", datos);
            var jsonRows = datos.rows;
            var jsonOrders = datos.orders;
            var htmlBuilder = "";
            var listavacia = "";
            for (var i=0;i<jsonOrders.length;i++) {    
                htmlBuilder += '<div align="center" class="lineGrid" id="lineGrid">';
                for (var j=0;j<jsonRows.length;j++) {    
                    if (jsonOrders[i].Order_id == jsonRows[j].Order_id) {
                        htmlBuilder += '<div style="border:0px solid grey;" id="' + jsonRows[j].Product_id + '_ROW">';
                        htmlBuilder += '<div align="center" class="imgGrid" style="float:left;"><img src="' + jsonRows[j].Imagen + '" height="100px"></img></div>';
                        if (jsonRows[j].Productoextra != "null") {
                            htmlBuilder += '<div align="left" class="nameGrid" style="float:left;">' + jsonRows[j].Producto + ' + ' + jsonRows[j].Productoextra + '</div>';
                            htmlBuilder += '<div align="right" id="' + jsonRows[j].Linea_id + '_Precio" class="priceGrid" style="float:left;">$' + priv.separaMiles((parseFloat(jsonRows[j].Precio) - parseFloat(jsonRows[j].Precioproductoextra)).toFixed(2)) + ' + $' + priv.separaMiles(jsonRows[j].Precioproductoextra) +'</div>';
                        } else {
                            htmlBuilder += '<div align="left" class="nameGrid" style="float:left;">' + jsonRows[j].Producto + '</div>';                            
                            htmlBuilder += '<div align="right" id="' + jsonRows[j].Linea_id + '_Precio" class="priceGrid" style="float:left;">$' + priv.separaMiles(jsonRows[j].Precio) + '</div>';
                        }
                        htmlBuilder += '<div align="center" class="qtyGrid" style="float:left;"><input class="chng_qty" type="text" value="' + priv.separaMiles(jsonRows[j].Cantidad) + '" id="' + jsonRows[j].Linea_id + '_Cantidad" /></div>';
                        //htmlBuilder += '<div align="right" id="' + jsonRows[j].Linea_id + '_Total" class="totalGrid" style="float:left;">$' + jsonRows[j].Total + '<br><a onclick="borraLinea(\'' + jsonRows[j].Linea_id + '\')">Eliminar</a></div>';
                        htmlBuilder += '<div align="right" id="totalGrid" class="totalGrid" style="float:left;">$' + priv.separaMiles(jsonRows[j].Total) + '<br><a id="' + jsonRows[j].Linea_id + '_Drop"class="drop_lin">Eliminar</a></div>';
                        htmlBuilder += '</div>';
                    } 
                }
                htmlBuilder += '</div>';
                htmlBuilder += '<div style="border:0px solid red;float:left;width:70%;">&nbsp;</div>';
                htmlBuilder += '<div class="netQty" id="netQty" style="border:0px solid red;float:left;width:10%;">' + priv.separaMiles(jsonOrders[i].Productos) + '</div>';
                htmlBuilder += '<div class="netTotal" style="border:0px solid red;float:left;width:20%;">';
                htmlBuilder += '<div class="subtotal" id="idSubTotal" align="right">Subtotal: $' + priv.separaMiles(jsonOrders[i].Subtotal) + '</div>';
                htmlBuilder += '<div class="impuestos" id="idImpuestos" align="right">Impuestos: $' + priv.separaMiles(jsonOrders[i].Impuestos) + '</div>';
                htmlBuilder += '<div class="total"  id="idTotal" align="right">Total: $' + priv.separaMiles(jsonOrders[i].Total) + '</div></div>';
                htmlBuilder += '<div class="cartBtn" id="cartBtn" style="float:left;width:100%;padding:2% 1% 1% 1%;border:0px solid red;" align="right">';
                htmlBuilder += '<br><br><input type="button" id="btn_guardar" onclick="guardarCambios()" value="Catálogo de productos" class="btn btn-default btn-sbmt sbmt_pedido btn_save"/>';
                if (j > 0) {
                    htmlBuilder += '&nbsp;&nbsp;<input type="submit" id="btn_submit" value="Colocar Pedido" class="btn btn-default btn-sbmt sbmt_pedido btn_sbmt"/></div>';
                }  else {
                    listavacia = '<br><br><h3 align="center">El carrito esta vacío, agrega algunos productos desde el catálogo de productos.</h3>';
                    listavacia += '<br><br><div align="center"><input type="button" id="btn_guardar" onclick="guardarCambios()" value="Catálogo de productos" class="btn btn-default btn-sbmt sbmt_pedido btn_save"/></div>';
                }
                htmlBuilder += '<input type="hidden" value="N" name="hdn_sbmt" id="hdn_sbmt"/>';
                htmlBuilder += '<input type="hidden" value="N" name="hdn_save" id="hdn_save"/> ';
                htmlBuilder += '<input type="hidden" value="N" name="hdn_lineas" id="hdn_save"/> ';
                htmlBuilder += '<input type="hidden" value="" name="productos_drop" id="productos_drop"/>';
                htmlBuilder += '<input type="hidden" value="" name="productos_change" id="productos_change"/>';
                htmlBuilder += '<input type="hidden" value="' + jsonOrders[i].Order_id + '" name="hdn_pedido_id" id="hdn_pedido_id"/>';
            }
        //console.log("$> HTML BUILDER: ", htmlBuilder);
        if (listavacia != "") {
            console.log("LISTA VACIA " + listavacia);
            document.getElementById('div_container').innerHTML = listavacia;
        } else {
            document.getElementById('div_container').innerHTML = htmlBuilder;
        }

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
            console.log("Crear Filtros");
            var jsonRows = pData.rows;
            var arrayMarca = [];
            var arrayCategoria = [];
            var marcas = "<strong>MARCAS</strong><br>";
            var categorias = "<strong>CATEGORÍA</strong><br>";
            //var caracteriticas = "<strong>CARACTERISTICA</strong><br>";
            var caracteriticas = "";
            for (var key in jsonRows) {
                var obj = jsonRows[key]; 
                if (arrayMarca.indexOf(obj.Marca) == -1 && obj.Precio != 0) {
                    //marcas += '<a class="fil_marca">' + obj.Marca + '</a><br>';
                    marcas += '<input class="fil_multi" type="checkbox" id = "'+obj.Marca+'"/>&nbsp;' + obj.Marca + '<br>';
                    arrayMarca.push(obj.Marca);
                }
                if (arrayCategoria.indexOf(obj.Categoria) == -1 && obj.Precio != 0) {
                    //categorias += '<a class="fil_cat">' + obj.Categoria + '</a><br>';
                    categorias += '<input class="fil_multi" type="checkbox" id = "'+obj.Categoria+'"/>&nbsp;' + obj.Categoria + '<br>';
                    arrayCategoria.push(obj.Categoria);
                }
            }
            console.log("Crear Filtros de caracteriticas: ", itemsChar);
            for (var indx=0; indx<itemsChar.heads.length; indx++){
                caracteriticas += '<br><strong>' + itemsChar.heads[indx].toUpperCase() + '</strong><br>';
                for (var indy=0; indy<itemsChar.items.length; indy++){
                    currentItem = itemsChar.items[indy].split("_");
                    if (currentItem[0] == itemsChar.heads[indx]){
                        //caracteriticas += '<a class="fil_car" id="'+ currentItem[0] +'">' + currentItem[1] + '</a><br>';
                        caracteriticas += '<input class="fil_multi" type="checkbox" id = "'+currentItem[0]+'_'+currentItem[1]+'"/>&nbsp;' + currentItem[1] + '<br>';
                    }
                }
            }
            console.log("Filtro de Precios");
            var filPrice = '<div style="display:none"><strong>PRECIOS</strong><br>';
            filPrice += '<input width="3%" type="text" class="txtPrecioLeft" id="precioDesde"/><br><input width="3%" type="text" class="txtPrecioRight" id="precioHasta"/><br></div>';

            // Construir Filtros de precios
            var filtros = filPrice + marcas + "<br>" + categorias + caracteriticas;
            //var filtros = marcas + "<br>" + categorias + caracteriticas;
            document.getElementById("cat_filter").innerHTML = filtros;
        };

        return publ;
    };

    $.fn.Carrito = function (koalas) {
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