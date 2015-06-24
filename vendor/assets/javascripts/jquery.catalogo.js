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
            //document.getElementById("cat_pro").innerHTML = '<div align="center"><strong> CATALOGO VACIO</strong></div>';
            document.getElementById("cat_pro").innerHTML = '<br><br><br><br><br><br><br><div id="loader-wrapper"><img src="load.gif" height="9%" width="6%"></img></div>';
        };
        priv.setData = function (pData) {
            priv.drawCat(pData);
        };
        priv.cleanData = function (pData) {
            console.log("Limpiar Catalogo");
            var search = '<div class="input-group"><span class="input-group-addon glyphicon glyphicon-search"></span><input type="text" class="form-control btn_search" aria-describedby="basic-addon1" id="txt_search" autofocus></div>';
            var tabla = search + '<br><div width="100%">';
            tabla += "</div>";
            document.getElementById("cat_pro").innerHTML = tabla;
        };
        priv.drawCat = function (pData) {
            console.log("Pintar Catalogo");
            //var jsonCols = pData.cols;
            var jsonRows = pData.rows;
            var search = '<div class="input-group"><span class="input-group-addon glyphicon glyphicon-search"></span><input type="text" class="form-control btn_search" aria-describedby="basic-addon1" id="txt_search" autofocus></div>';
            var tabla = search + '<br><div width="100%">';
            var style="";
            var product_ids = [];
            for (var key in jsonRows) {
                var obj = jsonRows[key]; 
                var inventario = parseFloat((obj.Inventario).replace(" Piezas", ""));
                if (obj.Precio != 0 && inventario > 0) {
                    var pextra = "";
                    var montoextra = 0;
                    montoextra = parseFloat(obj.Impuestoproductoextra) + parseFloat(obj.Precioproductoextra);
                    if (montoextra > 0) {
                        pextra = "Incluye $" + String(montoextra) + " (" + obj.Productoextra +  ")";
                    }
                    // Gestiona productos extra
                    //Incluye ' + parseFloat(obj.Precioproductoextra)+parseFloat(obj.Impuestoproductoextra) + ' (' + obj.Precioproductoextra + ') 
                    if (obj.Inventario == "0 Piezas"){ style = 'style="color:red;"';}
                    
                    var inventarioShow = "";
                    if (mostrarInventario == "true") {
                        inventarioShow = obj.Inventario;
                    }

                    tabla += '<a href="javascript:agregar();" class="addProduct"'+
                    ' id="' + obj.Producto_ID + '">'+
                    '<div class="itemA" align="left">'+
                    '<div align="center" class="bgImage"'+
                     'data-product-id='+obj.Producto_ID+
                     ' data-image-id='+obj.imageId+'>'+
                    '<br><br><br><br><br><br></div><br><b>'+
                    obj.Nombre +'</b><br>$'+
                    (parseFloat(obj.Precioshow)).toFixed(2)+' ' + pextra + '<br>'
                    +inventarioShow+'</div></a>';
                    style="";
                    product_ids.push(obj.Producto_ID);
                }
            }
            tabla += "</div>";
            document.getElementById("cat_pro").innerHTML = tabla;
            AdImage.init();
            AdImage.getAdImage(".bgImage");
            // PINTAR PAGINACIÓN
            priv.drawPagination(pData);
            
        };
        priv.drawPagination = function(pData) {
            var rows = pData.rows;
            var lon = filterData.rows.length;
            var items = 12; // Al cambiar este valor tambien hay que cambiar el hardcode que previene el infinity en catalogoproductos.html.erb / cambiaPagina() / cambiaPagina(1, 12);
            var htmlPag = '<nav><ul class="pagination pagination-sm"><li><a class="pagPrev" aria-label="Previous"><span id="' + items + '" aria-hidden="true">&laquo;</span></a></li>';
            for (var i=0;i<Math.ceil(lon / items);i++) {
                indx = i + 1;
                if (actualPage == indx) {
                    htmlPag += '<li><a style="font-weight:bold;background-color:#2980b9;color:#ecf0f1" id="' + items + '" class="pagChange">' + indx + '</a></li>';    
                } else {
                    htmlPag += '<li><a id="' + items + '" class="pagChange">' + indx + '</a></li>';    
                }
            }
            htmlPag += '<li><a class="pagNext" aria-label="Next"><span id="' + items + '" aria-hidden="true">&raquo;</span></a></li></ul></nav>';
            document.getElementById("cat_pag").innerHTML = htmlPag;
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
        publ.limpiarCatalogo = function (data) {
            console.log("Limpiar Vendor");
            priv.cleanData();
            return publ;
        };
        publ.drawFiltros = function(pData){
            console.log("Crear Filtros");
            var filAutoMarca = false;
            var filAutoModelo = false;
            var filAutoAno = false;
            var jsonRows = pData.rows;
            var arrayMarca = [];
            var arrayCategoria = [];
            var arrAutoMarca = [];
            var arrAutoModelo = [];
            var arrAutoAno = [];
            var marcas = '<strong>MARCAS<a id="btn_filtro_marcas" class="btn_filtro_marcas">&nbsp;<span class="glyphicon glyphicon-triangle-top" aria-hidden="true"></span></a></strong><br>';
            var categorias = '<strong>CATEGORÍA<a id="btn_filtro_categorias" class="btn_filtro_categorias">&nbsp;<span class="glyphicon glyphicon-triangle-top" aria-hidden="true"></span></a></strong><br>';
            // Filtro Automotriz
            var auto_marcas = '<strong>MARCA</strong><br><select class="selectAuto selectAutoMarca" id="selectAutoMarca"><option value="0">elige una marca</option>';
            var auto_modelo = '<strong>MODELO</strong><br><select class="selectAuto selectAutoModelo" id="selectAutoModelo"><option value="0">elige un modelo</option>';
            var auto_ano    = '<strong>AÑO</strong><br><select class="selectAuto selectAutoAno" id="selectAutoAno"><option value="0">elige un año</option>';
            // Ordenamiento de filtros
            var arrMarOrdenado = [];
            var arrCatOrdenado = [];

            var caracteriticas = "";
            marcas += '<div id="div_filtro_marcas">'
            categorias += '<div id="div_filtro_categorias">'
            for (var key in jsonRows) {
                var obj = jsonRows[key]; 
                if (arrayMarca.indexOf(obj.Marca) == -1 && obj.Precio != 0) {
                    //marcas += '<input class="fil_multi" type="checkbox" id = "'+obj.Marca+'"/>&nbsp;' + obj.Marca + '<br>';
                    arrMarOrdenado.push(obj.Marca);
                    arrayMarca.push(obj.Marca);
                }
                if (arrayCategoria.indexOf(obj.Categoria) == -1 && obj.Precio != 0) {
                    //categorias += '<input class="fil_multi" type="checkbox" id = "'+obj.Categoria+'"/>&nbsp;' + obj.Categoria + '<br>';
                    arrCatOrdenado.push(obj.Categoria);
                    arrayCategoria.push(obj.Categoria);
                }
                // Gestión para empresas con el módulo de automotrices instalada
                if (arrAutoMarca.indexOf(obj.autoMarca) == -1 && obj.Precio != 0 && obj.autoMarca != null) {
                    auto_marcas += '<option value = "'+obj.autoMarca+'">' + obj.autoMarca + '</option>';
                    arrAutoMarca.push(obj.autoMarca);
                    arrayAutoMarca.push(obj.autoMarca);
                    filAutoMarca = true;
                }
                if (arrAutoModelo.indexOf(obj.autoModelo) == -1 && obj.Precio != 0 && obj.autoModelo != null) {
                    //auto_modelo += '<option value = "'+obj.autoModelo+'">' + obj.autoModelo + '</option>';
                    //arrAutoModelo.push(obj.autoModelo);
                    arrayAutoModelo.push(obj.autoModelo);
                    filAutoModelo = true;
                }
                if (arrAutoAno.indexOf(obj.autoAno) == -1 && obj.Precio != 0 && obj.autoAno != null) {
                    //auto_ano += '<option value = "'+obj.autoAno+'">' + obj.autoAno + '</option>';
                    //arrAutoAno.push(obj.autoAno);
                    arrayAutoAno.push(obj.autoAno);
                    filAutoAno = true;
                }        
                if (obj.autoAno != null || obj.autoModelo != null || obj.autoAno != null) {
                    var nuevoItem = {
                        marca: obj.autoMarca,
                        modelo: obj.autoModelo,
                        ano: obj.autoAno
                    };
                    arrayFiltrosAuto.push(nuevoItem);
                }                                           
                // Termina - Gestión para empresas con el módulo de automotrices instalada
            }
            // ORDENAMIENTO DE FILTROS
            arrMarOrdenado.sort();
            arrCatOrdenado.sort();
            for (var orm = 0;orm<arrMarOrdenado.length;orm++) {
                marcas += '<input class="fil_multi" type="checkbox" id = "'+arrMarOrdenado[orm]+'"/>&nbsp;' + arrMarOrdenado[orm] + '<br>';
            }
            for (var orc = 0;orc<arrCatOrdenado.length;orc++) {
                categorias += '<input class="fil_multi" type="checkbox" id = "'+arrCatOrdenado[orc]+'"/>&nbsp;' + arrCatOrdenado[orc] + '<br>';
            }

            marcas += "</div>";
            categorias += "</div>";
            auto_marcas += "</select><br>";
            auto_modelo += "</select><br>";
            auto_ano    += "</select><br>";
            /*                  FILTROS CARACTERISTICAS                 */
            console.log("Crear Filtros de caracteriticas: ", itemsChar.heads);
            for (var indx=0; indx<itemsChar.heads.length; indx++){
                if (itemsChar.heads[indx].toUpperCase().length > 0) {
                    caracteriticas += '<br><strong>' + itemsChar.heads[indx].toUpperCase() + '<a id="btn_filtro_' + itemsChar.heads[indx].toUpperCase().replace(" ", "") + '" class="btn_filtro_caracteristicas">&nbsp;<span class="glyphicon glyphicon-triangle-top" aria-hidden="true"></span></a></strong><br>';
                    caracteriticas += '<div id="div_filtro_' + itemsChar.heads[indx].toUpperCase().replace(" ", "") + '">';
                    for (var indy=0; indy<itemsChar.items.length; indy++){
                        currentItem = itemsChar.items[indy].split("_");
                        if (currentItem[0] == itemsChar.heads[indx]){
                            //caracteriticas += '<a class="fil_car" id="'+ currentItem[0] +'">' + currentItem[1] + '</a><br>';
                            caracteriticas += '<input class="fil_multi" type="checkbox" id = "'+currentItem[0]+'_'+currentItem[1]+'"/>&nbsp;' + currentItem[1] + '<br>';
                        }
                    }
                    caracteriticas += '</div>';
                }
            }

            /*                  FILTROS PRECIOS                 */
            console.log("Filtro de Precios");
            var filPrice = '<div><strong>PRECIOS</strong><br>';
            filPrice += '<input width="3%" type="text" class="txtPrecioLeft txt_precio" id="precioDesde"  placeholder="Precios Desde"/><br><input width="3%" type="text" class="txtPrecioRight txt_precio" id="precioHasta"  placeholder="Precios Hasta"/><br></div><br>';

            // Construir Filtros de precios
            if (mostrarMarca != "true") {
                marcas = "";
            }
            if (mostrarCategoria != "true") {
                categorias = "";
            }            
            if (filAutoMarca != true) {
                auto_marcas = "";                   
            }
            if (filAutoModelo != true) {
                auto_modelo = "";                   
            }            
            if (filAutoAno != true) {
                auto_ano = "";                   
            }            
            // Que filtros mostrar? :
            console.log("Escribe Filtros: ", arrayFiltrosAuto);
            var filtros = filPrice + marcas + "<br>" + categorias + caracteriticas + auto_marcas + auto_modelo + auto_ano;
            //var filtros = marcas + "<br>" + categorias + caracteriticas;
            document.getElementById("cat_filter").innerHTML = filtros;
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
        console.log("Agregar JS VENDOR");
    }
