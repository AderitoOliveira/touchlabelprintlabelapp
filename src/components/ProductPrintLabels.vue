<template>
  <div id="order">
    <div class="container">
      <div class="outer-wrap">
        <div class="row">
          <div class="col-md-12">
              <ul id="table-header">
                <div class="row">
                  <!--li class="table-header-item col-md-2">
                    <div class="inner-label">Encomenda</div>
                  </li>
                  <li class="table-header-item col-md-2">
                    <div class="inner-label">Cliente</div>
                  </li>
                  <li class="table-header-item col-md-3">
                    <div class="inner-label">Data de Fecho</div>
                  </li>
                  <li class="table-header-item col-md-2">
                    <div class="inner-label">Total Produtos<br><strong>Total Produzidos</strong></div>
                  </li>
                  <li class="table-header-item col-md-2">
                    <div class="inner-label">Estado</div>
                  </li-->
                  <li class="table-header-item col-md-11">

                  </li>
                  <li class="table-header-item col-md-1">
                    <a class="search-toggle pull-right" @click="toggleSearch()">
                      <svg width="32" height="32" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M15.5 14H14.71L14.43 13.73C15.41 12.59 16 11.11 16 9.5C16 5.91 13.09 3 9.5 3C5.91 3 3 5.91 3 9.5C3 13.09 5.91 16 9.5 16C11.11 16 12.59 15.41 13.73 14.43L14 14.71V15.5L19 20.49L20.49 19L15.5 14V14ZM9.5 14C7.01 14 5 11.99 5 9.5C5 7.01 7.01 5 9.5 5C11.99 5 14 7.01 14 9.5C14 11.99 11.99 14 9.5 14Z" fill="#28a745"/>
                      </svg>
                    </a>
                  </li>
                </div>
              </ul>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <div v-if="showSearch" class="search-wrap">
                    <input type="text" class="form-control"  v-on:keyup="updateLen" v-model="search" placeholder="Pesquise pelo número da encomenda...">
            </div>
          </div>
        </div>
        <div id="card-content">
        <div class="row">

      <!--div class="container"-->
            <div class="form-photo col-md-3">
                <div class="form-item-inner">
                    <div class="photo-wrap">
                        <img :src="image_base + '/products_default.png'" class="product-image-label">
                        <!--<a ng-href="http://api.labelary.com/v1/printers/12dpmm/labels/3.5x1.5/0/%5EXA~TA000~JSN%5ELT0%5EMNW%5EMTD%5EPOI%5EPMN%5ELH0,0%5EJMA%5EPR2,2~SD15%5EJUS%5ELRN%5ECI0%5EXZ%5EXA%5EMMT%5EPW609%5ELL0406%5ELS0%5EFO448,224%5EGFA,02560,02560,00020,:Z64:eJzt0rFOwzAQBuAgBo8ZuyD8EKyV8ghMUSeUsQ+QASGBPHToBq/Ao1Ri8GgxMLdVBtZYDBh09XEOinMpEyrqgHyT9em3dT5dlqU6sK7H1ZnCUSVLdlzzbEGLX9qhvXzu2wxnq8muLFG+qN6WeJ+d4GKDso05jWdypbRF6aI1OEVXmNbng1m8RZDaevERbeun6HPTAjMLd4hCtzDnRj0KyjWDudC3ppzlRv0vjXPbweCKTJvWshzckD0Z17i3aL4z7WpuF32uHqwO72mYQ/0jdxkO/Uwn37kKmYmuF5dze9h1ORkuRAP6R7DF2OQphIlz8+cZFMyqNShflDznc5q8o28rfOUmnhHp0Xdm+Cj29qD62x1PluxI9m/rC6xTQdQ=:B188%5EFT569,77%5EA0I,32,31%5EFH/%5EFD(02)08712799413795(37)0002%5EFS%5EBY3,3,114%5EFT570,109%5EBCI,,N,N%5EFD%3E;%3E80208712799413795370002%5EFS%5EFT460,269%5EA0I,28,28%5EFH/%5EFDRef.143432%20Pot%20Lloyd%2022%20Anthracite%5EFS%5EFT110,44%5EA0I,28,24%5EFH/%5EFDQty:2%5EFS%5EPQ1,0,1,Y%5EXZ" target="_blank">
                        <img ng-src="http://api.labelary.com/v1/printers/12dpmm/labels/3.5x1.5/0/%5EXA~TA000~JSN%5ELT0%5EMNW%5EMTD%5EPOI%5EPMN%5ELH0,0%5EJMA%5EPR2,2~SD15%5EJUS%5ELRN%5ECI0%5EXZ%5EXA%5EMMT%5EPW609%5ELL0406%5ELS0%5EFO448,224%5EGFA,02560,02560,00020,:Z64:eJzt0rFOwzAQBuAgBo8ZuyD8EKyV8ghMUSeUsQ+QASGBPHToBq/Ao1Ri8GgxMLdVBtZYDBh09XEOinMpEyrqgHyT9em3dT5dlqU6sK7H1ZnCUSVLdlzzbEGLX9qhvXzu2wxnq8muLFG+qN6WeJ+d4GKDso05jWdypbRF6aI1OEVXmNbng1m8RZDaevERbeun6HPTAjMLd4hCtzDnRj0KyjWDudC3ppzlRv0vjXPbweCKTJvWshzckD0Z17i3aL4z7WpuF32uHqwO72mYQ/0jdxkO/Uwn37kKmYmuF5dze9h1ORkuRAP6R7DF2OQphIlz8+cZFMyqNShflDznc5q8o28rfOUmnhHp0Xdm+Cj29qD62x1PluxI9m/rC6xTQdQ=:B188%5EFT569,77%5EA0I,32,31%5EFH/%5EFD(02)08712799413795(37)0002%5EFS%5EBY3,3,114%5EFT570,109%5EBCI,,N,N%5EFD%3E;%3E80208712799413795370002%5EFS%5EFT460,269%5EA0I,28,28%5EFH/%5EFDRef.143432%20Pot%20Lloyd%2022%20Anthracite%5EFS%5EFT110,44%5EA0I,28,24%5EFH/%5EFDQty:2%5EFS%5EPQ1,0,1,Y%5EXZ" class="img-thumbnail center-block productLabelEmptySpace" height="400" width="200">
                        </a>-->
                    </div>
                </div>
            </div>
            <div class="col-md-5">
                <div class="row">
                <div class="col-md-12" id="product-label-print">
                    <div class="label-wrap">
                    <div class="label-left">
                        <div class="label-title">
                        Etiquetas de Produto
                        </div>
                        <div class="label-quantity">
                            <label class="control-label" for="qtyArticle">Quantidade</label>
                            <div class="input-wrap-inner">
                            <input type="qtyArticle" class="form-control" id="qtyArticle" placeholder="Número Etiquetas" ng-model="qtyArticle">
                            </div>
                        </div>
                    </div>
                    <div class="label-right">
                        <img class="label-detail" src="../assets/icons/bc_label_product.svg" width="244px" height="129px">
                    </div>
                    <div class="label-bottom">
                        <div class="label-options">
                            <div class="checkbox-wrap">
                            <input id="label-type" name="label-type" class="special-checkbox" type="checkbox" ng-model="qtyLabelsByLine" ng-change=""/>
                            <span class="checkbox-item"></span>
                            <label for="label-type">2 etiquetas por linha</label>
                            </div>
                        </div>
                        <div class="label-button">
                            <button type="submit" ng-click="printLabelArticle(product.ARTICLE_PRINTER_IP_ADDRESS, product.ARTICLE_PRINTER_PORT, product.Bar_Code_Tech_Sheet, product.PRODUCT_NAME_FOR_LABEL, product.CUSTOMER_PRODUCT_ID, product.ZPL_STRING_ARTICLE, product.ZPL_STRING_ARTICLE_2_COLUMNS_1_LABEL, product.ZPL_STRING_ARTICLE_2_COLUMNS_MULTIPLE_LABEL, product.ARTICLE_BARCODE_TYPE, qtyArticle, qtyLabelsByLine)" class="btn btn-default btn-save"><img src="../assets/icons/symbol-print.svg" width="20px" height="18px" />Imprimir</button>
                        </div>
                    </div>
                    </div>
                </div>
                <div class="col-md-12" id="box-label-print">
                    <div class="label-wrap">
                        <div class="label-left">
                        <div class="label-title">
                            Etiquetas de Caixa
                        </div>
                        <div class="label-quantity">
                            <label class="control-label" for="qtyBox">Quantidade</label>
                            <div class="input-wrap-inner">
                                <input type="qtyBox" class="form-control" id="qtyBox" placeholder="Número Etiquetas" ng-model="qtyBox">
                            </div>
                        </div>
                        </div>
                        <div class="label-right">
                        <img class="label-detail" src="../assets/icons/bc_label_box.svg" width="244px" height="129px">
                        </div>
                        <div class="label-bottom">
                        <div class="label-button">
                            <button type="submit" ng-click="printLabelBox(product.BOX_PRINTER_IP_ADDRESS, product.BOX_PRINTER_PORT, product.Bar_Code_Tech_Sheet, product.PRODUCT_NAME_FOR_LABEL, product.CUSTOMER_PRODUCT_ID, product.ZPL_STRING_BOX, product.BOX_BARCODE_TYPE, product.Qty_By_Box, qtyBox)" class="btn btn-default btn-save"><img src="../assets/icons/symbol-print.svg" width="20px" height="18px" />Imprimir</button>
                        </div>
                        </div>
                    </div>
                </div>
                </div>
            </div>


                </div>
            </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
import _ from 'lodash';

let sitebase
let imageBase

if (process.env.NODE_ENV === 'development') {
  sitebase = 'http://192.168.1.14:8080/',
  imageBase = 'http://192.168.1.14:8080/images/'
} else {
  sitebase = 'http://touchlabel-castanheira-dantas.e4ff.pro-eu-west-1.openshiftapps.com/',
  imageBase = 'http://touchlabel-castanheira-dantas.e4ff.pro-eu-west-1.openshiftapps.com'
}

const getProducts = 'firstProducts'
const searchProduct = 'getProduct/'

export default {
  name: 'ListProducts',
  data () {
    return {
      icon: 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAIISURBVHgB7VfLccJADJUJd0gHBhogHUAJqQB3EK45YSogVBDoIB3gDuIGIL7mhCvAeQ9kxqzXH8iMM5Phzeyw2ZX0JK0kgjMYDCZJkryJSFeaQeQ4ju/0+/0v/OFKs4jbKelut3OkASDQBB/dlvwR7sSNoX2NsOu6bLkht61Wy9Xj+HA4hFEUBXIFahGDkEQv2Hpi6XfcsVpjbD/gxBxORFU2K1MNgwsYZq9PpXzI8M6jLHRmcisxo+z1ep9KeAamXICoxliP7H3ucbY21H3q0kaRfUcb+mKA8C3hOUlNxTnkfJsh2OH5zHAyxBoj83FG7shnjRikCwvpKiVlKrH2uhbquM9sZBUwk4dqK89hHiBaT05FdAGkdK2kNOTL6U25photI5znKcSDzVElsVZvDpl28SzXqU5o00Xks0pieB3blLWHS5F9SwP5FrQQz+26x8FBLC13a3VuZFNEFpeVxEyppT3O6dICo6FYFyt9qgQTyWO13W5XOXtF7QSiDavSkPchZ82IDg3fOI5QlE+124mCiPqZfWgSQ/E9TSkd5B7DYmOSUpfDpejdrREbkfhiDIYaWKbpt9grjjgLvik87+m7xyWivFtStog0i1rfTvpt43HP1KKI+PbHFgER77jCkna6jdhwIsBHIL/E/X+u/0/MPt5Lc7+bUkQPnU7nW0djU+Qx+F5/ADN8+ahyQQG5AAAAAElFTkSuQmCC',
      products: '',
      search: '',
      image_base: imageBase,
      'showSearch': false
    }
  },
  mounted () {
    axios({ method: 'GET', 'url': sitebase + getProducts }).then(result => {
      this.products = result.data
    }, error => {
      console.error(error)
    })
  },
  computed: {
    
  },
  methods: {

  }
}
</script>

<style>
#app {
  font-family: 'Roboto', sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
ul#table-header {
    padding: 0px 12px;
    width: 100%;
    float: left;
    text-align: left;
    background: #DADADA;
    font-style: normal;
    font-weight: bold;
    font-size: 16px;
    line-height: 19px;
    height: 48px;
    margin-bottom:0px;
}

.status-inner{
  height:100%;
  max-width:100%;
  transition:width 0.5s ease-in-out;
}

li.table-header-item {
    display: block;
    float: left;
    text-align: left;
    justify-content: center;
    flex: 1;
    align-items: center;
    height: 48px;
}
ul#table-content {
    display: flex;
    flex-direction: column;
    padding: 0px;
    margin-bottom:0px;
}

li.order-item {
    display: flex;
    flex-direction: row;
    flex: 1;
}

ul.order-item-list {
    display: flex;
    flex-direction: row;
    flex: 1;
    justify-content: space-between;
    padding: 0px;
}

li.order-item-detail {
    display: table-cell;
    text-align: left;
}

.outer-wrap {
    box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.25);
    border-radius: 10px;
    background-color: #fff;
    margin-bottom:48px;
    overflow: hidden;
}

.inner-label {
    display: flex;
    height: 48px;
    flex-direction: column;
    text-align: left;
    justify-content: center;
    align-items: flex-start;
}

a.order-link {
    width: 100%;
    float: left;
    padding: 0px 15px;
    color:#222;

}

a.order-link > ul{
  padding:14px 0px;
}

.status-wrap {
    width: calc(100% + 30px);
    float: left;
    height: 10px;
    margin-left: -15px;
    margin-right: -15px;
    background: #EDEDED;
    box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.25);
}

.search-wrap {
    position: relative;
    padding: 8px 12px;
    background: #e6e6e6;
    border-bottom: 1px solid #dedede;
}

input.form-control {
  border-radius: 2px;
  box-shadow: inset 2px 2px 4px 0px rgba(88, 88, 88, 0.5);
  background-color: #ffffff;
  border: solid 1px #28a745;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  font-stretch: normal;
  line-height: normal;
  letter-spacing: normal;
  height: 35px;
  min-width: 200px;
}

input.form-control:focus {
  border: solid 2px #222;
  outline: none;
  box-shadow: inset 2px 2px 4px 0px rgba(88, 88, 88, 0.2);
}

a.search-toggle {
    height: 48px;
    width: 32px;
    margin-top: 0px;
    padding: 10px 0px;
    position: absolute;
    cursor:pointer;
}

.label-wrap {
    width: 100%;
    float: left;
    box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.25);
    border-radius: 10px;
    padding: 15px;
    background: #E5E1E1;
}
 

<!-- -->

.label-left {
    max-width: 50%;
    float: left;
    padding-right: 20px;

}

.label-title {
    font-style: normal;
    font-weight: 500;
    line-height: normal;
    font-size: 18px;
    color: #222222;
}

.label-right {
	 max-width: 50%;
	 float: left;
}
img.label-detail {
	 max-width: 100%;
}

.label-bottom {
	 width: 100%;
	 float: left;
}

.label-options {
	 padding-top: 12px;
	 padding-bottom: 24px;
}

.label-options label {
	 margin-left: 29px;
	 line-height: 26px;
	 cursor: pointer;
}

.checkbox-wrap {
	 margin-top: 4px;
}

.checkbox-wrap {
	 position: relative;
}

.checkbox-wrap input.special-checkbox, .checkbox-wrap .checkbox-all {
	 opacity: 0;
	 position: absolute;
	 width: 24px;
	 height: 24px;
	 top: 0px;
	 left: 12px;
	 width: 24px;
	 height: 24px;
	 z-index: 1;
}

.checkbox-wrap span.checkbox-item {
	 width: 24px;
	 height: 24px;
	 position: relative;
	 background-image: url(../assets/icons/checkbox.png);
	 background-size: 24px;
	 background-position: 0px 0px;
	 position: absolute;
}

.checkbox-wrap input.special-checkbox:checked ~ span.checkbox-item, .checkbox-wrap input.checkbox-all:checked ~ span.checkbox-item {
	 background-position: 0px 24px;
}

.label-button button.btn-save {
	 height: 48px;
	 width: 100%;
	 text-align: center;
	 border-radius: 2px;
	 background-color: #27ae60;
	 font-size: 16px;
	 font-weight: normal;
	 font-style: normal;
	 font-stretch: normal;
	 line-height: normal;
	 letter-spacing: normal;
	 color: #fff;
	 border: 0px;
	 width: 100%;
	 max-width: 50%;
}

.label-button button img {
	 margin-right: 6px;
}

.form-wrap, .label-quantity, #main-action-wrap {
	 padding-top: 36px;
}

.form-wrap label.control-label, .label-quantity label.control-label, #main-action-wrap label.control-label, .form-wrap .control-label, .label-quantity .control-label, #main-action-wrap .control-label {
	 width: 100%;
	 float: left;
	 text-align: left !important;
	 font-size: 16px;
	 font-weight: bold;
	 font-style: normal;
	 font-stretch: normal;
	 line-height: normal;
	 letter-spacing: normal;
	 color: #222;
	 margin-bottom: 8px;
	 padding-top: 0px;
}

.form-wrap label.control-label.nolabel, .label-quantity label.control-label.nolabel, #main-action-wrap label.control-label.nolabel, .form-wrap .control-label.nolabel, .label-quantity .control-label.nolabel, #main-action-wrap .control-label.nolabel {
	 height: 19px;
}

.form-wrap .photo-wrap, .label-quantity .photo-wrap, #main-action-wrap .photo-wrap {
	 box-shadow: 0 4px 4px 0 rgba(0, 0, 0, 0.25);
	 width: 100%;
	 float: left;
	 border-radius: 10px;
	 overflow: hidden;
}

.form-wrap .photo-wrap .btn, .label-quantity .photo-wrap .btn, #main-action-wrap .photo-wrap .btn {
	 width: 100%;
	 float: left;
	 border: none;
	 background-color: #dcd51e;
	 font-size: 18px;
	 font-weight: normal;
	 font-style: normal;
	 font-stretch: normal;
	 line-height: normal;
	 letter-spacing: normal;
	 color: #fff;
	 border-radius: 0px;
	 padding: 12px 0px;
}

.form-wrap .form-row, .label-quantity .form-row, #main-action-wrap .form-row {
	 margin-bottom: 24px;
}

.form-wrap a.photo-link, .label-quantity a.photo-link, #main-action-wrap a.photo-link {
	 width: 100%;
	 float: left;
}

.form-wrap a.photo-link img, .label-quantity a.photo-link img, #main-action-wrap a.photo-link img {
	 width: 100%;
	 float: left;
	 height: auto;
}

.form-wrap input.form-control, .label-quantity input.form-control, #main-action-wrap input.form-control {
	 border-radius: 2px;
	 box-shadow: inset -1px -1px 2px 0 rgba(118, 118, 118, 0.25);
	 background-color: #fff;
	 border: solid 1px #c4c4c4;
	 font-size: 16px;
	 font-weight: normal;
	 font-style: normal;
	 font-stretch: normal;
	 line-height: normal;
	 letter-spacing: normal;
	 height: 48px;
}

.form-wrap .btn-tech-sheet, .label-quantity .btn-tech-sheet, #main-action-wrap .btn-tech-sheet {
	 height: 48px;
	 border-radius: 2px;
	 background: #2755ae !important;
	 width: 100%;
	 text-align: center;
	 font-size: 16px;
	 font-weight: normal;
	 font-style: normal;
	 font-stretch: normal;
	 line-height: normal;
	 letter-spacing: normal;
	 color: #fff;
}

.form-wrap button.btn-cancel, .label-quantity button.btn-cancel, #main-action-wrap button.btn-cancel {
	 height: 48px;
	 width: 100%;
	 text-align: center;
	 border-radius: 2px;
	 background-color: #c21414;
	 font-size: 16px;
	 font-weight: normal;
	 font-style: normal;
	 font-stretch: normal;
	 line-height: normal;
	 letter-spacing: normal;
	 color: #fff;
	 border: 0px;
}

.form-wrap button.btn-remove, .label-quantity button.btn-remove, #main-action-wrap button.btn-remove {
	 height: 48px;
	 width: 100%;
	 text-align: center;
	 border-radius: 2px;
	 background-color: #dcd51e;
	 font-size: 16px;
	 font-weight: normal;
	 font-style: normal;
	 font-stretch: normal;
	 line-height: normal;
	 letter-spacing: normal;
	 color: #fff;
	 border: 0px;
}

.form-wrap button.btn-remove img, .label-quantity button.btn-remove img, #main-action-wrap button.btn-remove img {
	margin-top: -3px;
}

.form-wrap button.btn-save, .label-quantity button.btn-save, #main-action-wrap button.btn-save {
	 height: 48px;
	 width: 100%;
	 text-align: center;
	 border-radius: 2px;
	 background-color: #27ae60;
	 font-size: 16px;
	 font-weight: normal;
	 font-style: normal;
	 font-stretch: normal;
	 line-height: normal;
	 letter-spacing: normal;
	 color: #fff;
	 border: 0px;
	 width: 100%;
}

.form-wrap button.btn-save-small, .label-quantity button.btn-save-small, #main-action-wrap button.btn-save-small {
	 height: 30px;
	 text-align: center;
	 border-radius: 2px;
	 background-color: #27ae60;
	 font-size: 14px;
	 font-weight: normal;
	 font-style: normal;
	 font-stretch: normal;
	 line-height: normal;
	 letter-spacing: normal;
	 color: #fff;
	 border: 0px;
}

.form-wrap button img, .label-quantity button img, #main-action-wrap button img {
	 margin-right: 6px;
}

.form-wrap .button-holder, .label-quantity .button-holder, #main-action-wrap .button-holder {
	 padding-top: 12px;
}


</style>