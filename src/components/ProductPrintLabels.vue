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
                            <input id="label-type" name="label-type" class="special-checkbox" type="checkbox" v-model="qtyLabelsByLine"/>
                            <span class="checkbox-item"></span>
                            <label for="label-type">2 etiquetas por linha</label>
                            </div>
                        </div>
                        <div class="label-button">
                            <button type="submit" @click="printLabelArticle(qtyArticle, qtyLabelsByLine)" class="btn btn-default btn-save"><img src="../assets/icons/symbol-print.svg" width="20px" height="18px" />Imprimir</button>
                        </div>
                    </div>
                    </div>
                </div>
                <div class="col-md-12" id="box-label-print"  v-if="showLabelBoxCounter == 'false'">
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
                                <button type="submit" @click="printBoxLabels(null, null, null, qtyBox)" class="btn btn-default btn-save"><img src="../assets/icons/symbol-print.svg" width="20px" height="18px" />Imprimir</button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-12" id="box-label-print"  v-if="showLabelBoxCounter == 'true'">
                    <div class="label-wrap">
                        <div class="label-left">
                        <div class="label-title">
                            Etiquetas de Caixa
                        </div>
                        <div class="label-quantity" v-if="labelHasCounterButNoCurrentOrders == false">
                            <label class="control-label" for="orderId">Num. Encomenda</label>
                            <b-form-select v-model="b_form_selected" :options="ordersForProductsWithCounter"></b-form-select>
                            
                        </div>
                        <div class="label-quantity" v-if="labelHasCounterButNoCurrentOrders == true">
                            <label class="control-label" for="orderId">Num. Encomenda</label>
                            <div class="input-wrap-inner">
                                <input type="orderNumber" class="form-control" id="orderNumber" placeholder="Número Encomenda" v-model="orderNumber">
                            </div>
                        </div>
                        <div class="label-quantity">
                            <label class="control-label" for="qtyBox">Contador Caixas</label>
                            <div class="input-wrap-inner">
                                <div class="row">
                                    <div class="col-md-5">
                                        <input type="boxCounterInitial" class="form-control" id="boxCounterInitial" placeholder="Num. etiqueta inicial" v-model="boxCounterInitial">
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
                            <div class="label-button" v-if="labelHasCounterButNoCurrentOrders == false">
                                <!--button type="submit" ng-click="printLabelBox(this.productLabel[0].BOX_PRINTER_IP_ADDRESS, this.productLabel[0].BOX_PRINTER_PORT, this.productLabel[0].Bar_Code_Tech_Sheet, this.productLabel[0].PRODUCT_NAME_FOR_LABEL, this.productLabel[0].CUSTOMER_PRODUCT_ID, this.productLabel[0].ZPL_STRING_BOX, this.productLabel[0].BOX_BARCODE_TYPE, this.productLabel[0].Qty_By_Box, b_form_selected)" class="btn btn-default btn-save"><img src="../assets/icons/symbol-print.svg" width="20px" height="18px" />Imprimir</button-->
                                <button type="submit" @click="printBoxLabels(b_form_selected, boxCounterInitial, boxCounterFinal, null)" class="btn btn-default btn-save"><img src="../assets/icons/symbol-print.svg" width="20px" height="18px" />Imprimir</button>
                            </div>
                            <div class="label-button" v-if="labelHasCounterButNoCurrentOrders == true">
                                <!--button type="submit" ng-click="printLabelBox(this.productLabel[0].BOX_PRINTER_IP_ADDRESS, this.productLabel[0].BOX_PRINTER_PORT, this.productLabel[0].Bar_Code_Tech_Sheet, this.productLabel[0].PRODUCT_NAME_FOR_LABEL, this.productLabel[0].CUSTOMER_PRODUCT_ID, this.productLabel[0].ZPL_STRING_BOX, this.productLabel[0].BOX_BARCODE_TYPE, this.productLabel[0].Qty_By_Box, b_form_selected)" class="btn btn-default btn-save"><img src="../assets/icons/symbol-print.svg" width="20px" height="18px" />Imprimir</button-->
                                <button type="submit" @click="printBoxLabels(orderNumber, boxCounterInitial, boxCounterFinal, null)" class="btn btn-default btn-save"><img src="../assets/icons/symbol-print.svg" width="20px" height="18px" />Imprimir</button>
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
  //sitebase = 'http://touchlabel-castanheira-dantas.e4ff.pro-eu-west-1.openshiftapps.com/',
  //imageBase = 'http://touchlabel-castanheira-dantas.e4ff.pro-eu-west-1.openshiftapps.com'
  sitebase = 'http://192.168.1.8:8080/',
  imageBase = 'http://192.168.1.8:8080/images/'
}

const getProductLabelDetail = 'labelToPrintForProduct/'
const getDropdownOrderId    = 'orderidfordropdowninlabel/'
const searchProduct = 'getProduct/'

export default {
  name: 'ListProducts',
  data () {
    return {
      icon: 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAIISURBVHgB7VfLccJADJUJd0gHBhogHUAJqQB3EK45YSogVBDoIB3gDuIGIL7mhCvAeQ9kxqzXH8iMM5Phzeyw2ZX0JK0kgjMYDCZJkryJSFeaQeQ4ju/0+/0v/OFKs4jbKelut3OkASDQBB/dlvwR7sSNoX2NsOu6bLkht61Wy9Xj+HA4hFEUBXIFahGDkEQv2Hpi6XfcsVpjbD/gxBxORFU2K1MNgwsYZq9PpXzI8M6jLHRmcisxo+z1ep9KeAamXICoxliP7H3ucbY21H3q0kaRfUcb+mKA8C3hOUlNxTnkfJsh2OH5zHAyxBoj83FG7shnjRikCwvpKiVlKrH2uhbquM9sZBUwk4dqK89hHiBaT05FdAGkdK2kNOTL6U25photI5znKcSDzVElsVZvDpl28SzXqU5o00Xks0pieB3blLWHS5F9SwP5FrQQz+26x8FBLC13a3VuZFNEFpeVxEyppT3O6dICo6FYFyt9qgQTyWO13W5XOXtF7QSiDavSkPchZ82IDg3fOI5QlE+124mCiPqZfWgSQ/E9TSkd5B7DYmOSUpfDpejdrREbkfhiDIYaWKbpt9grjjgLvik87+m7xyWivFtStog0i1rfTvpt43HP1KKI+PbHFgER77jCkna6jdhwIsBHIL/E/X+u/0/MPt5Lc7+bUkQPnU7nW0djU+Qx+F5/ADN8+ahyQQG5AAAAAElFTkSuQmCC',
      productLabel: {},
      ordersForProductsWithCounter: {},
      labelHasCounterButNoCurrentOrders: false,
      showPage: 'true',
      showLabelBoxCounter: 'false',
      qtyLabelsByLine: false,
      customerProductId: '',
      image_base: imageBase,
      qtyArticle: '',
      qtyBox: '',
      boxCounterInitial: '',
      boxCounterFinal:'',
      b_form_selected: '',
      orderId: '',
      orderNumber: '',
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
      console.log(sitebase + getProductLabelDetail + encodeURIComponent(this.customerProductId));
      console.log(JSON.stringify(this.productLabel));
      //console.log("this.productLabel[0].LABEL_HAS_COUNTER: " + this.productLabel[0].LABEL_HAS_COUNTER)
      if ( this.productLabel.length > 0) 
      {
        if ( this.productLabel[0].LABEL_HAS_COUNTER == 'true') 
        {
            this.showLabelBoxCounter='true'
        } else {
            this.showLabelBoxCounter='false'
        }
      } else {
          this.showPage='false'
          this.launchModal()
      }
      //console.log(this.productLabel[0].LABEL_HAS_COUNTER)
    }, error => {
      console.error(error)
    });

    axios({ method: 'GET', 'url': sitebase + getDropdownOrderId + encodeURIComponent(this.customerProductId) }).then(result => {
      this.ordersForProductsWithCounter = result.data;
      console.log("this.ordersForProductsWithCounter: " + JSON.stringify(this.ordersForProductsWithCounter))
      if ( this.ordersForProductsWithCounter.length == 0) 
      {
          this.labelHasCounterButNoCurrentOrders = true
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
    },
    padDigits (number, digits) {
      return Array(Math.max(digits - String(number).length + 1, 0)).join(0) + number
    },
    timer (ms) {
      return new Promise(resolve => setTimeout(resolve, ms))
    },
    replaceAll (str, map) {
      for (let key in map) {
        let str2 = str.split(key).join(map[key])
        str = str2
        str2 = null
      }
      return str
    },
    reverseString (data) {
      var rev = [];
      let revStr = ''
      for (let i = data.length - 1, j = 0; i >= 0; i--, j++) {
          rev[j] = data[i];
      }
      revStr = rev.join('');
      return revStr;
    },
    eanCheckDigit (barCode) {
      alert("barCode inside eanCheckDigit: " + barCode) 
      let result = 0
      let rs = this.reverseString(barCode)
      for (let counter = 0; counter < rs.length; counter++) {
        result = result + parseInt(rs.charAt(counter)) * Math.pow(3, ((counter + 1) % 2))
      }
      return (10 - (result % 10)) % 10
    },
    sendZplToPrinter (printerIPAddress, printerPort, zpl) {
      // console.log('Zpl Enviado para a Impressora' + zpl)

      let url = 'http://' + printerIPAddress + ':' + printerPort
      let method = 'POST'
      let async = true
      let request = new XMLHttpRequest()

      request.onload = function () {
        let status = request.status
        let data = request.responseText
        output.innerHTML = 'Status: ' + status + '<br>' + data
      }

      request.open(method, url, async)

      // Actually sends the request to the server.

      console.log('sending...')
      request.timeout = 100
      console.log('ZPL:' + zpl)
      request.send(zpl)
      // request.done;

      console.log('end')
    },
    async executeCycleToPrintLabels (zplString, counterInitialNumber, counterFinalNumber, printerIPAddress, printerPort) { // We need to wrap the loop into an async function for this to work
      let zplStringAux = zplString
      let totalLabelsToPrint = counterFinalNumber - counterInitialNumber

      console.log('Inside executeCycleToPrintLabels')
      console.log('totalLabelsToPrint: ' + totalLabelsToPrint   )

      // this.isLoading = true
      // this.loadSimpleSpinner = true
      let timeToWait = totalLabelsToPrint * 2
      // this.loadSimpleSpinnerMessage = 'Faltam ' + timeToWait + ' segundos para terminar a impressão'
      let digitsForPadding = counterFinalNumber.toString().length

      for (let i = counterInitialNumber; i <= counterFinalNumber; i++) {
        let counterValueTestLabel = this.padDigits(i, digitsForPadding) + ''

        let map = {
          '_COUNTER_VALUE': counterValueTestLabel
        }

        let sendToPrinterAllLabels = this.replaceAll(zplStringAux, map)
        this.sendZplToPrinter(printerIPAddress, printerPort, sendToPrinterAllLabels)
        zplStringAux = zplString
        //console.log('ZPL_FINAL:' + sendToPrinterAllLabels)
        console.log('*******************************************************************************************')

        await this.timer(500) // then the created Promise can be awaited // COMMENTED FOR REMOVING SPPINNER

        timeToWait = timeToWait - 2
        // this.loadSimpleSpinnerMessage = 'Faltam ' + timeToWait + ' segundos para terminar a impressão'


        if (i === totalLabelsToPrint) {
          // this.isLoading = false
          // this.loadSimpleSpinner = false
          // this.$refs['modal-paint-2'].show()
        }
      }

      // this.$refs['modal-paint-2'].show() // ADDED FOR REMOVING SPPINNER
    },
    async printLabelArticle (numberOfLabelsToPrint, qtyLabelsByLine) {

      let customerProductId = this.productLabel[0].CUSTOMER_PRODUCT_ID
      let barCodeNumber = this.productLabel[0].Bar_Code_Tech_Sheet
      let productNameForLabel = this.productLabel[0].PRODUCT_NAME_FOR_LABEL
      let ZPLString = this.productLabel[0].ZPL_STRING_ARTICLE
      let zplStringTest = this.productLabel[0].ZPL_STRING_ARTICLE
      let ZPL_STRING_ARTICLE_2_COLUMNS_1_LABEL = this.productLabel[0].ZPL_STRING_ARTICLE_2_COLUMNS_1_LABEL
      let ZPL_STRING_ARTICLE_2_COLUMNS_1_LABEL_TEST = this.productLabel[0].ZPL_STRING_ARTICLE_2_COLUMNS_1_LABEL
      let ZPL_STRING_ARTICLE_2_COLUMNS_MULTIPLE_LABEL = this.productLabel[0].ZPL_STRING_ARTICLE_2_COLUMNS_MULTIPLE_LABEL
      let ZPL_STRING_ARTICLE_2_COLUMNS_MULTIPLE_LABEL_TEST = this.productLabel[0].ZPL_STRING_ARTICLE_2_COLUMNS_MULTIPLE_LABEL
      let printerIPAddress = this.productLabel[0].ARTICLE_PRINTER_IP_ADDRESS
      let printerPort = this.productLabel[0].ARTICLE_PRINTER_PORT
      let labelHasCounter = this.productLabel[0].LABEL_HAS_COUNTER
      let numberLabelsOnArticle = this.productLabel[0].NUMBER_LABELS_ON_ARTICLE
      let labelsWith2Columns = qtyLabelsByLine
      let checkDigit = 0
      let eanWithCheckDigit = 0
      let quantityToReplace = 0
      let sendToPrinter = ''
      let sendToPrinterTest = ''

      // We need to remove the first digit to calculate the checksum for the EAN-13
      if (barCodeNumber.charAt(0) === '0') {
        barCodeNumber = barCodeNumber.slice(1)
        checkDigit = this.eanCheckDigit('' + barCodeNumber)
        eanWithCheckDigit = barCodeNumber + checkDigit
        quantityToReplace = 0
      } else {
        eanWithCheckDigit = barCodeNumber
        quantityToReplace = 0
      }

      if (labelHasCounter === 'true') {
        numberOfLabelsToPrint = numberOfLabelsToPrint * numberLabelsOnArticle
      }

      let mapTestLabel = {
        '_EAN_CHECK_DIGIT': eanWithCheckDigit,
        '_NUM_ARTIGO': customerProductId,
        '_PRINT_QUANTITY': 1
      }

      let map = {
        '_EAN_CHECK_DIGIT': eanWithCheckDigit,
        '_NUM_ARTIGO': customerProductId,
        '_PRINT_QUANTITY': quantityToReplace
      }

      if (productNameForLabel.indexOf('\n') === -1) {
        // alert("No newline characters")
        map._NOME_ARTIGO = productNameForLabel
        mapTestLabel._NOME_ARTIGO = productNameForLabel
      } else {
        // alert("Contains newline characters")
        var productNameForLabelSplit = productNameForLabel.split('\n')

        var nomeArtigo = productNameForLabelSplit[0]
        map._NOME_ARTIGO = nomeArtigo
        mapTestLabel._NOME_ARTIGO = nomeArtigo

        for (let i = 1; i < productNameForLabelSplit.length; i++) {
          map['_ARTIGO_NOME_EXT_' + i] = productNameForLabelSplit[i]
          mapTestLabel['_ARTIGO_NOME_EXT_' + i] = productNameForLabelSplit[i]
        }
      }

      if (labelsWith2Columns == false) {
        // The _PRINT_QUANTITY in the map can only be changed directly
        map._PRINT_QUANTITY = numberOfLabelsToPrint
        sendToPrinter = this.replaceAll(ZPLString, map)
        console.log('labelsWith2Columns === false: sendToPrinter: ' + sendToPrinter)
        sendToPrinterTest = this.replaceAll(zplStringTest, mapTestLabel)
      } else {
        if (numberOfLabelsToPrint === 1) {
          console.log('numberOfLabelsToPrint === 1: sendToPrinter: ' + sendToPrinter)
          // ZPL_STRING_ARTICLE_2_COLUMNS_1_LABEL  --> Only 1 label is written and the other is blank
          // ZPL_STRING_ARTICLE_2_COLUMNS_MULTIPLE_LABEL --> Both Labels are written
          map._PRINT_QUANTITY = 1
          mapTestLabel._PRINT_QUANTITY = 2
          sendToPrinter = this.replaceAll(ZPL_STRING_ARTICLE_2_COLUMNS_1_LABEL, map)
          sendToPrinterTest = this.replaceAll(ZPL_STRING_ARTICLE_2_COLUMNS_1_LABEL_TEST, mapTestLabel)
          return
        }
        if (numberOfLabelsToPrint % 2 === 0) {
          console.log('numberOfLabelsToPrint: ' + numberOfLabelsToPrint)
          map._PRINT_QUANTITY = numberOfLabelsToPrint / 2
          mapTestLabel._PRINT_QUANTITY = 2
          sendToPrinter = this.replaceAll(ZPL_STRING_ARTICLE_2_COLUMNS_MULTIPLE_LABEL, map)
          console.log('numberOfLabelsToPrint % 2 === 0: sendToPrinter: ' + sendToPrinter)
          sendToPrinterTest = this.replaceAll(ZPL_STRING_ARTICLE_2_COLUMNS_1_LABEL_TEST, mapTestLabel)
        }
        if (numberOfLabelsToPrint % 2 !== 0) {
          console.log('numberOfLabelsToPrint: ' + numberOfLabelsToPrint)
          map._PRINT_QUANTITY = Math.ceil(numberOfLabelsToPrint / 2)
          mapTestLabel._PRINT_QUANTITY = 2
          sendToPrinter = this.replaceAll(ZPL_STRING_ARTICLE_2_COLUMNS_MULTIPLE_LABEL_TEST, map)
          console.log('numberOfLabelsToPrint % 2 !== 0: sendToPrinter: ' + sendToPrinter)
          sendToPrinterTest = this.replaceAll(ZPL_STRING_ARTICLE_2_COLUMNS_1_LABEL_TEST, mapTestLabel)

          map._PRINT_QUANTITY = 1
          sendToPrinter = sendToPrinter + this.replaceAll(ZPL_STRING_ARTICLE_2_COLUMNS_1_LABEL, map)
        }
      }

      this.sendZplToPrinter(printerIPAddress, printerPort, sendToPrinter)
    },
    async printBoxLabels (orderId, counterInitialNumber, counterFinalNumber, numberOfLabelsToPrint) {

      let customerProductId = this.productLabel[0].CUSTOMER_PRODUCT_ID
      let barCodeNumber = this.productLabel[0].Bar_Code_Tech_Sheet
      let qtyByBox = this.productLabel[0].Qty_By_Box
      let productNameForLabel = this.productLabel[0].PRODUCT_NAME_FOR_LABEL
      let boxBarCodeType = this.productLabel[0].BOX_BARCODE_TYPE
      let zplStringTestLabel = this.productLabel[0].ZPL_STRING_BOX
      let zplStringAllLabels = this.productLabel[0].ZPL_STRING_BOX
      let printerIPAddress = this.productLabel[0].BOX_PRINTER_IP_ADDRESS
      let printerPort = this.productLabel[0].BOX_PRINTER_PORT
      let labelHasCounter = this.productLabel[0].LABEL_HAS_COUNTER
      let numberLabelsOnBox = this.productLabel[0].NUMBER_LABELS_ON_BOX
      let FullEan = ''
      let checkDigit = ''
      let EanWithCheckDigit = ''
      let quantityFull = ''
      let sendToPrinterTestLabel = ''
      let sendToPrinterAllLabels = ''
      let quantityBoxLabels = 0

      if(numberOfLabelsToPrint != null) {
        quantityBoxLabels = numberOfLabelsToPrint
      } else {
        quantityBoxLabels = counterFinalNumber
      }

      if (labelHasCounter === 'false') {
        if (boxBarCodeType === 'GS1-128') {
          quantityFull = this.padDigits(qtyByBox, 4)

          if (barCodeNumber.charAt(0) !== '0') {
            barCodeNumber = '0' + barCodeNumber
            EanWithCheckDigit = barCodeNumber
            FullEan = '802' + barCodeNumber + '37' + quantityFull
          } else {
            checkDigit = this.eanCheckDigit('' + barCodeNumber)
            EanWithCheckDigit = barCodeNumber + checkDigit
            // In the 802 the 8 it's for the size of the code bar and the 02 is the Application Identifier of the
            // GS1-128 BarCode
            FullEan = '802' + barCodeNumber + checkDigit + '37' + quantityFull
          }

          let map = {
            '_EAN_CHECK_DIGIT': EanWithCheckDigit,
            '_QUANTIDADE_EXTENDIDA': quantityFull,
            '_FULL_EAN': FullEan,
            '_NUM_ARTIGO': customerProductId,
            '_NOME_ARTIGO': productNameForLabel,
            '_ORDER_ID': orderId,
            '_QUANTIDADE': qtyByBox,
            '_PRINT_QUANTITY': quantityBoxLabels
          }

          let mapTestLabel = {
            '_EAN_CHECK_DIGIT': EanWithCheckDigit,
            '_QUANTIDADE_EXTENDIDA': quantityFull,
            '_FULL_EAN': FullEan,
            '_NUM_ARTIGO': customerProductId,
            '_NOME_ARTIGO': productNameForLabel,
            '_ORDER_ID': orderId,
            '_QUANTIDADE': qtyByBox,
            '_PRINT_QUANTITY': 1
          }

          //sendToPrinterTestLabel = this.replaceAll(zplStringTestLabel, mapTestLabel)

          sendToPrinterAllLabels = this.replaceAll(zplStringAllLabels, map)

          this.sendZplToPrinter(printerIPAddress, printerPort, sendToPrinterAllLabels)
        }

        if (boxBarCodeType === 'EAN13') {
          quantityFull = this.padDigits(qtyByBox, 4)

          // We need to remove the first digit to calculate the checksum for the EAN-13
          if (barCodeNumber.charAt(0) === '0') {
            barCodeNumber = barCodeNumber.slice(1)
            checkDigit = this.eanCheckDigit('' + barCodeNumber)
            EanWithCheckDigit = barCodeNumber + checkDigit
          } else {
            EanWithCheckDigit = barCodeNumber
          }

          let map = {
            '_EAN_CHECK_DIGIT': EanWithCheckDigit,
            '_QUANTIDADE_EXTENDIDA': quantityFull,
            '_NUM_ARTIGO': customerProductId,
            '_ORDER_ID': orderId,
            '_QUANTIDADE': qtyByBox,
            '_PRINT_QUANTITY': quantityBoxLabels
          }

          let mapTestLabel = {
            '_EAN_CHECK_DIGIT': EanWithCheckDigit,
            '_QUANTIDADE_EXTENDIDA': quantityFull,
            '_FULL_EAN': FullEan,
            '_NUM_ARTIGO': customerProductId,
            '_ORDER_ID': orderId,
            '_QUANTIDADE': qtyByBox,
            '_PRINT_QUANTITY': 1
          }

          if (productNameForLabel.indexOf('\n') === -1) {
            map._NOME_ARTIGO = productNameForLabel
            mapTestLabel._NOME_ARTIGO = productNameForLabel
          } else {
            let productNameForLabelSplit = productNameForLabel.split('\n')

            let nomeArtigo = productNameForLabelSplit[0]
            map._NOME_ARTIGO = nomeArtigo
            mapTestLabel._NOME_ARTIGO = nomeArtigo

            for (let i = 1; i < productNameForLabelSplit.length; i++) {
              map['_ARTIGO_NOME_EXT_' + i] = productNameForLabelSplit[i]
              mapTestLabel['_ARTIGO_NOME_EXT_' + i] = productNameForLabelSplit[i]
            }
          }

          //sendToPrinterTestLabel = this.replaceAll(zplStringTestLabel, mapTestLabel)

          sendToPrinterAllLabels = this.replaceAll(zplStringAllLabels, map)

          this.sendZplToPrinter(printerIPAddress, printerPort, sendToPrinterAllLabels)
        }

      } else { // THE LABEL HAS A COUNTER
        // We need to remove the first digit to calculate the checksum for the EAN-13
        if (barCodeNumber.charAt(0) === '0') {
          barCodeNumber = barCodeNumber.slice(1)
          checkDigit = this.eanCheckDigit('' + barCodeNumber)
          EanWithCheckDigit = barCodeNumber + checkDigit
        } else {
          EanWithCheckDigit = barCodeNumber
        }

        let map = {
          '_EAN_CHECK_DIGIT': EanWithCheckDigit,
          '_QUANTIDADE_EXTENDIDA': quantityFull,
          '_NUM_ARTIGO': customerProductId,
          '_ORDER_ID': orderId,
          '_QUANTIDADE': qtyByBox,
          '_PRINT_QUANTITY': numberLabelsOnBox, // THIS IS THE NUMBER OF LABELS IN EACH BOX (2, 3, etc ...)
          '_COUNTER_MAX_VALUE': quantityBoxLabels
        }

        let counterValueTestLabel = this.padDigits(1, quantityBoxLabels.toString().length) + ''

        let mapTestLabel = {
          '_EAN_CHECK_DIGIT': EanWithCheckDigit,
          '_QUANTIDADE_EXTENDIDA': quantityFull,
          '_FULL_EAN': FullEan,
          '_NUM_ARTIGO': customerProductId,
          '_ORDER_ID': orderId,
          '_QUANTIDADE': qtyByBox,
          '_PRINT_QUANTITY': 1,
          '_COUNTER_MAX_VALUE': quantityBoxLabels,
          '_COUNTER_VALUE': counterValueTestLabel
        }

        if (productNameForLabel.indexOf('\n') === -1) {
          map._NOME_ARTIGO = productNameForLabel
          mapTestLabel._NOME_ARTIGO = productNameForLabel
        } else {
          let productNameForLabelSplit = productNameForLabel.split('\n')

          let nomeArtigo = productNameForLabelSplit[0]
          map._NOME_ARTIGO = nomeArtigo
          mapTestLabel._NOME_ARTIGO = nomeArtigo

          for (let i = 1; i < productNameForLabelSplit.length; i++) {
            map['_ARTIGO_NOME_EXT_' + i] = productNameForLabelSplit[i]
            mapTestLabel['_ARTIGO_NOME_EXT_' + i] = productNameForLabelSplit[i]
          }
        }

        //let digitsForPadding = totalLabelsToPrint.toString().length

        //sendToPrinterTestLabel = this.replaceAll(zplStringTestLabel, mapTestLabel)

        sendToPrinterAllLabels = this.replaceAll(zplStringAllLabels, map)

        //await this.executeCycleToPrintLabels(sendToPrinterAllLabels, totalLabelsToPrint, digitsForPadding, printerIPAddress, printerPort)
        await this.executeCycleToPrintLabels(sendToPrinterAllLabels, counterInitialNumber, counterFinalNumber, printerIPAddress, printerPort)

      }
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