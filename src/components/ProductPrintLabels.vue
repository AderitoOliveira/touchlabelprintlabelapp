<template>
  <div id="order">
    <div class="container">
      <div class="outer-wrap">
        <div id="card-content">
        <div class="row">
      <!--div class="container"-->
            <div class="form-photo col-md-3 offset-md-1">
                <div class="form-item-inner">
                    <div class="photo-wrap">
                        <img :src="image_base + '/products_default.png'" class="product-image-label">
                        <!--<a ng-href="http://api.labelary.com/v1/printers/12dpmm/labels/3.5x1.5/0/%5EXA~TA000~JSN%5ELT0%5EMNW%5EMTD%5EPOI%5EPMN%5ELH0,0%5EJMA%5EPR2,2~SD15%5EJUS%5ELRN%5ECI0%5EXZ%5EXA%5EMMT%5EPW609%5ELL0406%5ELS0%5EFO448,224%5EGFA,02560,02560,00020,:Z64:eJzt0rFOwzAQBuAgBo8ZuyD8EKyV8ghMUSeUsQ+QASGBPHToBq/Ao1Ri8GgxMLdVBtZYDBh09XEOinMpEyrqgHyT9em3dT5dlqU6sK7H1ZnCUSVLdlzzbEGLX9qhvXzu2wxnq8muLFG+qN6WeJ+d4GKDso05jWdypbRF6aI1OEVXmNbng1m8RZDaevERbeun6HPTAjMLd4hCtzDnRj0KyjWDudC3ppzlRv0vjXPbweCKTJvWshzckD0Z17i3aL4z7WpuF32uHqwO72mYQ/0jdxkO/Uwn37kKmYmuF5dze9h1ORkuRAP6R7DF2OQphIlz8+cZFMyqNShflDznc5q8o28rfOUmnhHp0Xdm+Cj29qD62x1PluxI9m/rC6xTQdQ=:B188%5EFT569,77%5EA0I,32,31%5EFH/%5EFD(02)08712799413795(37)0002%5EFS%5EBY3,3,114%5EFT570,109%5EBCI,,N,N%5EFD%3E;%3E80208712799413795370002%5EFS%5EFT460,269%5EA0I,28,28%5EFH/%5EFDRef.143432%20Pot%20Lloyd%2022%20Anthracite%5EFS%5EFT110,44%5EA0I,28,24%5EFH/%5EFDQty:2%5EFS%5EPQ1,0,1,Y%5EXZ" target="_blank">
                        <img ng-src="http://api.labelary.com/v1/printers/12dpmm/labels/3.5x1.5/0/%5EXA~TA000~JSN%5ELT0%5EMNW%5EMTD%5EPOI%5EPMN%5ELH0,0%5EJMA%5EPR2,2~SD15%5EJUS%5ELRN%5ECI0%5EXZ%5EXA%5EMMT%5EPW609%5ELL0406%5ELS0%5EFO448,224%5EGFA,02560,02560,00020,:Z64:eJzt0rFOwzAQBuAgBo8ZuyD8EKyV8ghMUSeUsQ+QASGBPHToBq/Ao1Ri8GgxMLdVBtZYDBh09XEOinMpEyrqgHyT9em3dT5dlqU6sK7H1ZnCUSVLdlzzbEGLX9qhvXzu2wxnq8muLFG+qN6WeJ+d4GKDso05jWdypbRF6aI1OEVXmNbng1m8RZDaevERbeun6HPTAjMLd4hCtzDnRj0KyjWDudC3ppzlRv0vjXPbweCKTJvWshzckD0Z17i3aL4z7WpuF32uHqwO72mYQ/0jdxkO/Uwn37kKmYmuF5dze9h1ORkuRAP6R7DF2OQphIlz8+cZFMyqNShflDznc5q8o28rfOUmnhHp0Xdm+Cj29qD62x1PluxI9m/rC6xTQdQ=:B188%5EFT569,77%5EA0I,32,31%5EFH/%5EFD(02)08712799413795(37)0002%5EFS%5EBY3,3,114%5EFT570,109%5EBCI,,N,N%5EFD%3E;%3E80208712799413795370002%5EFS%5EFT460,269%5EA0I,28,28%5EFH/%5EFDRef.143432%20Pot%20Lloyd%2022%20Anthracite%5EFS%5EFT110,44%5EA0I,28,24%5EFH/%5EFDQty:2%5EFS%5EPQ1,0,1,Y%5EXZ" class="img-thumbnail center-block productLabelEmptySpace" height="400" width="200">
                        </a>-->
                    </div>
                </div>
            </div>
            <div class="col-md-6">
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
                            <input type="qtyArticle" class="form-control" id="qtyArticle" placeholder="Número Etiquetas" v-model="qtyArticle">
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
                <div class="col-md-12" id="box-label-print"  v-if="showPage == 'false'">
                    <div class="label-wrap">
                        <div class="label-left">
                        <div class="label-title">
                            Etiquetas de Caixa
                        </div>
                        <div class="label-quantity">
                            <label class="control-label" for="qtyBox">Quantidade</label>
                            <div class="input-wrap-inner">
                                <input type="qtyBox" class="form-control" id="qtyBox" placeholder="Número Etiquetas" v-model="qtyBox">
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

                <div class="col-md-12" id="box-label-print"  v-if="showPage == 'true'">
                    <div class="label-wrap">
                        <div class="label-left">
                        <div class="label-title">
                            Etiquetas de Caixa
                        </div>
                        <div class="label-quantity">
                            <label class="control-label" for="orderId">Num. Encomenda</label>
                            <div class="input-wrap-inner">
                                <input type="orderId" class="form-control" id="orderId" placeholder="Número da encomenda" v-model="orderId">
                            </div>
                        </div>
                        <div class="label-quantity">
                            <label class="control-label" for="qtyBox">Contador Caixas</label>
                            <div class="input-wrap-inner">
                                <div class="row">
                                    <div class="col-md-5">
                                        <input type="boxCounterIntial" class="form-control" id="boxCounterIntial" placeholder="Num. etiqueta inicial" v-model="boxCounterIntial">
                                    </div>
                                    <div class="col-md-2 offset-md-3">
                                        <input type="boxCounterFinal" class="form-control" id="boxCounterFinal" placeholder="Num. etiqueta final" v-model="boxCounterFinal">
                                    </div>
                                </div>
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
    <b-modal
      ref="modal-paint"
      id="modal-1"
      :modal-class="centermodal"
      :title="modal.title"
      :okTitle="modal.ok_button"
      :footer-class="(modal_action ? 'no_action' : 'action')"
       @ok="goToListProducts()"
       ok-only
       :okVariant='danger'
    >
      <p class="my-4">{{modal.content}}</p>
    </b-modal>
  </div>
</template>

<script>
import axios from 'axios'
import _ from 'lodash';
import Loading from 'vue-loading-overlay'
// Import stylesheet
import 'vue-loading-overlay/dist/vue-loading.css'

import Spinner from 'vue-simple-spinner'

let sitebase
let imageBase

if (process.env.NODE_ENV === 'development') {
  sitebase = 'http://' + process.env.IP_ADDRESS + ':8080/',
  imageBase = 'http://' + process.env.IP_ADDRESS + ':8080/images/'
} else {
  sitebase = 'http://touchlabel-castanheira-dantas.e4ff.pro-eu-west-1.openshiftapps.com/',
  imageBase = 'http://touchlabel-castanheira-dantas.e4ff.pro-eu-west-1.openshiftapps.com'
}

const getProductLabelDetail = 'labelToPrintForProduct/'
const searchProduct = 'getProduct/'

export default {
  name: 'ListProducts',
  data () {
    return {
      icon: 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAIISURBVHgB7VfLccJADJUJd0gHBhogHUAJqQB3EK45YSogVBDoIB3gDuIGIL7mhCvAeQ9kxqzXH8iMM5Phzeyw2ZX0JK0kgjMYDCZJkryJSFeaQeQ4ju/0+/0v/OFKs4jbKelut3OkASDQBB/dlvwR7sSNoX2NsOu6bLkht61Wy9Xj+HA4hFEUBXIFahGDkEQv2Hpi6XfcsVpjbD/gxBxORFU2K1MNgwsYZq9PpXzI8M6jLHRmcisxo+z1ep9KeAamXICoxliP7H3ucbY21H3q0kaRfUcb+mKA8C3hOUlNxTnkfJsh2OH5zHAyxBoj83FG7shnjRikCwvpKiVlKrH2uhbquM9sZBUwk4dqK89hHiBaT05FdAGkdK2kNOTL6U25photI5znKcSDzVElsVZvDpl28SzXqU5o00Xks0pieB3blLWHS5F9SwP5FrQQz+26x8FBLC13a3VuZFNEFpeVxEyppT3O6dICo6FYFyt9qgQTyWO13W5XOXtF7QSiDavSkPchZ82IDg3fOI5QlE+124mCiPqZfWgSQ/E9TSkd5B7DYmOSUpfDpejdrREbkfhiDIYaWKbpt9grjjgLvik87+m7xyWivFtStog0i1rfTvpt43HP1KKI+PbHFgER77jCkna6jdhwIsBHIL/E/X+u/0/MPt5Lc7+bUkQPnU7nW0djU+Qx+F5/ADN8+ahyQQG5AAAAAElFTkSuQmCC',
      productLabel: {},
      showPage: '',
      customerProductId: '',
      image_base: imageBase,
      qtyArticle: '',
      qtyBox: '',
      modal_action: false,
      modal_trigger: '',
      centermodal: ['centermodal'],
      modal: {
        title: 'Default Modal Title',
        content: 'this is the modal content',
      }
    }
  },
  created () {
      this.customerProductId = this.$route.params.customerProductId;
  },
  mounted () {
    axios({ method: 'GET', 'url': sitebase + getProductLabelDetail + encodeURIComponent(this.customerProductId) }).then(result => {
      this.productLabel = result.data;
      if ( this.productLabel.length == 0) 
      {
          this.showPage='false'
          this.launchModal()
      }
      //console.log(this.productLabel[0].LABEL_HAS_COUNTER)
    }, error => {
      console.error(error)
    })
  },
  computed: {
    
  },
  methods: {
   launchModal () {
    this.modal_action = false
    this.modal = {
        title: 'Configuração em Falta',
        content: 'Este producto não tem a associação entre o produto e o cliente ou não existe etiqueta criada para o cliente!',
        ok_button: 'Fechar'
    }
    this.$refs['modal-paint'].show()
    },
    goToListProducts () {
        this.$router.push('/listProducts')
    }
  }
}
</script>

<style lang="stylus">

.centermodal > div {
  position: relative;
  margin: 0 auto;
  top: 25%;
}

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
    text-align: left;
}

.label-left {
    max-width: 50%;
    float: left;
    padding-right: 20px;
    .label-quantity {
        padding-top: 22px;
    }
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

.label-quantity label.control-label,  .label-quantity .control-label {
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


.input-wrap-inner {
	 color: #c21414;
	 font-size: 14px;
	 font-weight: normal;
	 width: 100%;
	 float: left;
	 padding: 6px 0 6px;
}

.product-image-label{
    width:100%;
    height:auto;
    float:left;
    border-radius:4px;
    box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
}

.form-wrap, .label-quantity, #main-action-wrap {
    padding-top: 36px;
    label.control-label, .control-label {
        width: 100%;
        float: left;
        text-align: left !important;
        font-size: 16px;
        font-weight: bold;
        font-style: normal;
        font-stretch: normal;
        line-height: normal;
        letter-spacing: normal;
        color: #222222;
        margin-bottom:8px;
        padding-top:0px;
        &.nolabel{
            height:19px;
        }
    }
    .photo-wrap {
        box-shadow: 0 4px 4px 0 rgba(0, 0, 0, 0.25);
        width: 100%;
        float: left;
        border-radius:  10px;
        overflow: hidden;
        .btn {
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
            color: #ffffff;
            border-radius: 0px;
            padding: 12px 0px;
        }
    }
    .form-row{
        margin-bottom:24px;
    }
    a.photo-link {
        width: 100%;
        float: left;
        img {
            width: 100%;
            float: left;
            height: auto;
        }
    }
    input.form-control {
        border-radius: 2px;
        box-shadow: inset -1px -1px 2px 0 rgba(118, 118, 118, 0.25);
        background-color: #ffffff;
        border: solid 1px #c4c4c4;
        font-size: 16px;
        font-weight: normal;
        font-style: normal;
        font-stretch: normal;
        line-height: normal;
        letter-spacing: normal;
        height: 48px;
    }
    .btn-tech-sheet {
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
        color: #ffffff;
    }
    
    button.btn-cancel {
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
        color: #ffffff;
        border: 0px;
    }

    button.btn-remove {
        height: 48px;
        width: 100%;
        text-align: center;
        border-radius: 2px;
        background-color: #DCD51E;
        font-size: 16px;
        font-weight: normal;
        font-style: normal;
        font-stretch: normal;
        line-height: normal;
        letter-spacing: normal;
        color: #ffffff;
        border: 0px;
        img {
            margin-top: -3px;
        }
    }
    
    button.btn-save {
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
        color: #ffffff;
        border: 0px;
        width: 100%;
    }

    button.btn-save-small {
        height: 30px;
        //width: 100%;
        text-align: center;
        border-radius: 2px;
        background-color: #27ae60;
        font-size: 14px;
        font-weight: normal;
        font-style: normal;
        font-stretch: normal;
        line-height: normal;
        letter-spacing: normal;
        color: #ffffff;
        border: 0px;
    }

    button img{
        margin-right:6px;
    }
    .button-holder {
        padding-top: 12px;
    }
}

#box-label-print{
    padding-top:36px;
}

input.form-control, textarea{
    border:solid 1px #c4c4c4 !important;
    &:focus{
        border-color:#222222 !important;
        outline:none !important;
        box-shadow:inset -1px -1px 2px 0 rgba(118,118,118,0.25) !important;
    }
}


</style>