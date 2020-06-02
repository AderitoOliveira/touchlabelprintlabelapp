<template>
  <div id="order">
    <div class="container">
      <loading :active.sync="isLoading" 
        :can-cancel="true"
        :color="color_loading"
        :loader="loader_loading"
        :background-color="background_loading"
        :opacity="opacity_loading"
        :is-full-page="fullPage">
      </loading>
      <div class="outer-wrap">
        <div class="row">
          <div class="col-md-12">
              <ul id="table-header">
                <div class="row">
                  <li class="table-header-item col-md-1">
                    <div class="inner-label">Encomenda</div>
                  </li>
                  <li class="table-header-item col-md-2">
                    <div class="inner-label">Ref. Cliente</div>
                  </li>
                  <li class="table-header-item col-md-2">
                    <div class="inner-label">Ref. Interna</div>
                  </li>
                  <li class="table-header-item col-md-2">
                    <div class="inner-label">Nome Produto<br></div>
                  </li>
                  <li class="table-header-item col-md-2">
                    <div class="inner-label"><span class="light">Etiquetas Artigo</span>Etiquetas Caixa</div>
                  </li>
                  <li class="table-header-item col-md-3">
                      <div class="inner-label"></div>
                  </li>
                  <!--li class="table-header-item col-md-1">
                    <a class="search-toggle" @click="toggleSearch()">
                      <svg width="32" height="32" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M15.5 14H14.71L14.43 13.73C15.41 12.59 16 11.11 16 9.5C16 5.91 13.09 3 9.5 3C5.91 3 3 5.91 3 9.5C3 13.09 5.91 16 9.5 16C11.11 16 12.59 15.41 13.73 14.43L14 14.71V15.5L19 20.49L20.49 19L15.5 14V14ZM9.5 14C7.01 14 5 11.99 5 9.5C5 7.01 7.01 5 9.5 5C11.99 5 14 7.01 14 9.5C14 11.99 11.99 14 9.5 14Z" fill="#28a745"/>
                      </svg>
                    </a>
                  </li-->
                </div>
              </ul>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <div v-if="showSearch" class="search-wrap"><input type="text" class="form-control" v-model="search" placeholder="Pesquise pelo número da encomenda..."></div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <ul id="table-content" class="row">
              <!-- <li class="order-item col-md-12" v-bind:key="index + labelsToPrint.CUSTOMER_PRODUCT_ID" v-for="(label, index) in filterLabels"> -->
                <li class="order-item col-md-12" v-for="label in labelsToPrint" :key="label.CUSTOMER_PRODUCT_ID">
                <!--a v-if=" order.STATUS != 'Fechada'" class="order-link" v-bind:href="'#/order/'+order.ORDER_ID"-->
                  <ul class="order-item-list row">
                    <li class="order-item-detail col-md-1"><div class="item-inner"><strong>{{label.ORDER_ID}}</strong></div></li>
                    <li class="order-item-detail col-md-2"><div class="item-inner">{{label.CUSTOMER_PRODUCT_ID}}</div></li>
                    <li class="order-item-detail col-md-2"><div class="item-inner">{{label.INTERNAL_PRODUCT_ID}}</div></li>
                    <li class="order-item-detail col-md-2"><div class="item-inner">{{label.PRODUCT_NAME}}</div></li>
                    <li class="order-item-detail col-md-2"><div class="item-inner">{{label.QTY_LABELS_TO_PRINT_ARTICLE}} / <strong>{{label.QTY_LABELS_TO_PRINT_BOX}}</strong></div></li>
                    <div class="col-md-3 table-item item-actions flex-right">
                          <a class="btn btn-black" v-if="label.ARTICLE_LABEL_ALREADY_PRINTED === 'false'" @click="printLabelArticle(label.UNIQUE_ID, label.CUSTOMER_PRODUCT_ID, label.ORDER_ID, label.QTY_LABELS_TO_PRINT_ARTICLE, label.BOX_LABEL_ALREADY_PRINTED)" data-toggle="tooltip">
                            <img src="../assets/icons/vase-btn.svg" width="20px" height="18px" />Imprimir Artigo
                        </a>
                        <a class="btn btn-black btn-outline" v-if="label.BOX_LABEL_ALREADY_PRINTED === 'false'"   @click="printBoxLabels(label.UNIQUE_ID, label.CUSTOMER_PRODUCT_ID, label.ORDER_ID, label.QTY_LABELS_TO_PRINT_BOX, label.ARTICLE_LABEL_ALREADY_PRINTED)" data-toggle="tooltip" title="Imprimir Etiquetas Caixa">
                            <img src="../assets/icons/box-btn.svg" width="20px" height="18px" />Imprimir Caixa
                        </a>
                        <!--a class="btn btn-lg btn-remove" ng-click="deleteLabelToPrint(productLabel.UNIQUE_ID, productLabel.ORDER_ID, productLabel.CUSTOMER_PRODUCT_ID)" data-toggle="tooltip" title="Remover Etiquetas">
                            <img src="assets/icons/btn-remove.svg" width="24px" height="24px" />
                        </a-->
                    </div>
                  </ul>
                  <!--div class="status-wrap">
                    <div class="status-inner" :style="{width: Math.round(order.QTY_PRODUCED * 100 / order.QTY_ORDERED)+'%', background: 'hsl(calc('+Math.round(order.QTY_PRODUCED * 100 / order.QTY_ORDERED)+' * .9), 50%, 50%)'}"></div>
                  </div-->
                <!--/a-->
              </li>
            </ul>
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
      cancelTitle="Cancelar"
      :ok-only="modal_action"
      @ok="launchSecondModal()"
    >
      <p class="my-4">{{modal.content}}</p>
    </b-modal>
    <b-modal
      ref="modal-paint-2"
      id="modal-2"
      :modal-class="centermodal"
      :title="modal.title"
      :okTitle="modal.ok_button"
      :footer-class="(modal_action ? 'no_action' : 'action')"
      cancelTitle="Cancelar"
      :ok-only="modal_action"
      @ok="executeLabelsPostOperations()"
    >
      <p class="my-4">{{modal.content}}</p>
    </b-modal>
  </div>
</template>

<script>
import axios from 'axios'
// import { request } from 'http'
// Import component
import Loading from 'vue-loading-overlay'
// Import stylesheet
import 'vue-loading-overlay/dist/vue-loading.css'

let sitebase

if (process.env.NODE_ENV === 'development') {
  sitebase = 'http://localhost:8080/'
} else {
  sitebase = 'http://touchlabel-castanheira-dantas.e4ff.pro-eu-west-1.openshiftapps.com/'
}

const getLabels = 'getLabelsToPrint'

export default {
  name: 'ListOrders',
  data () {
    return {
      icon: 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAIISURBVHgB7VfLccJADJUJd0gHBhogHUAJqQB3EK45YSogVBDoIB3gDuIGIL7mhCvAeQ9kxqzXH8iMM5Phzeyw2ZX0JK0kgjMYDCZJkryJSFeaQeQ4ju/0+/0v/OFKs4jbKelut3OkASDQBB/dlvwR7sSNoX2NsOu6bLkht61Wy9Xj+HA4hFEUBXIFahGDkEQv2Hpi6XfcsVpjbD/gxBxORFU2K1MNgwsYZq9PpXzI8M6jLHRmcisxo+z1ep9KeAamXICoxliP7H3ucbY21H3q0kaRfUcb+mKA8C3hOUlNxTnkfJsh2OH5zHAyxBoj83FG7shnjRikCwvpKiVlKrH2uhbquM9sZBUwk4dqK89hHiBaT05FdAGkdK2kNOTL6U25photI5znKcSDzVElsVZvDpl28SzXqU5o00Xks0pieB3blLWHS5F9SwP5FrQQz+26x8FBLC13a3VuZFNEFpeVxEyppT3O6dICo6FYFyt9qgQTyWO13W5XOXtF7QSiDavSkPchZ82IDg3fOI5QlE+124mCiPqZfWgSQ/E9TSkd5B7DYmOSUpfDpejdrREbkfhiDIYaWKbpt9grjjgLvik87+m7xyWivFtStog0i1rfTvpt43HP1KKI+PbHFgER77jCkna6jdhwIsBHIL/E/X+u/0/MPt5Lc7+bUkQPnU7nW0djU+Qx+F5/ADN8+ahyQQG5AAAAAElFTkSuQmCC',
      labelsToPrint: '',
      search: '',
      'showSearch': false,
      isLoading: false,
      fullPage: true,
      color_loading: '#006400',
      loader_loading: 'bars',
      background_loading: '#b2b2b2',
      opacity_loading: 0.8,
      modal_action: true,
      actiontype: '',
      modal_trigger: '',
      centermodal: ['centermodal'],
      first_modal_action_object: {},
      second_modal_action_object: {},
      operations_to_execute_after_print: {},
      modal: {
        title: 'Default Modal Title',
        content: 'this is the modal content',
        ok_button: 'Fazer coisas',
        cancelTitle: 'Cancelar'
      },
      labelToPrintDetail: ''
    }
  },
  components: {
    Loading
  },
  mounted () {
    axios({ method: 'GET', 'url': sitebase + getLabels }).then(result => {
      this.labelsToPrint = result.data
    }, error => {
      console.error(error)
    })
  },
  computed: {
    filterLabels: function () {
      let filtered = this.labelsToPrint
      if (this.search) {
        filtered = this.labelsToPrint.filter(
          o => o.ORDER_ID.toLowerCase().indexOf(this.search) > -1
        )
      }
      return filtered
    }
  },
  methods: {
    toggleSearch () {
      if (this.showSearch === true) {
        this.showSearch = false
        this.search = ''
      } else {
        this.showSearch = true
      }
    },
    padDigits (number, digits) {
      return Array(Math.max(digits - String(number).length + 1, 0)).join(0) + number
    },
    launchModal (actiontype) {
      let data = this.first_modal_action_object
      console.log('data inside modal: ' + JSON.stringify(data))
      this.modal_action = false
      this.actiontype = actiontype

      console.log('actiontype ' + actiontype)
      if (actiontype === 'article_label') {
        this.modal = {
          title: 'Imprimir Etiquetas',
          content: 'A etiqueta de teste foi impressa com sucesso ?' + '\n\n Pretende imprimir as ' + this.first_modal_action_object.quantityArticleLabels + ' etiquetas do artigo?',
          ok_button: 'Imprimir'
        }
      } else {
        this.modal = {
          title: 'Imprimir Etiquetas',
          content: 'A etiqueta de teste foi impressa com sucesso ?' + '\n\n Pretende imprimir as ' + this.first_modal_action_object.quantity_box_labels + ' etiquetas da caixa?',
          ok_button: 'Imprimir'
        }
      }
      this.$refs['modal-paint'].show()
    },
    timer (ms) {
      return new Promise(resolve => setTimeout(resolve, ms))
    },
    async executeCycleToPrintLabels (zplString, totalLabelsToPrint, digitsForPadding, printerIPAddress, printerPort) { // We need to wrap the loop into an async function for this to work
      let zplStringAux = zplString

      console.log('Inside executeCycleToPrintLabels')
      console.log('totalLabelsToPrint: ' + totalLabelsToPrint)

      this.isLoading = true

      for (let i = 1; i <= totalLabelsToPrint; i++) {
        let counterValueTestLabel = this.padDigits(i, digitsForPadding) + ''

        let map = {
          '_COUNTER_VALUE': counterValueTestLabel
        }

        let sendToPrinterAllLabels = this.replaceAll(zplStringAux, map)
        this.sendZplToPrinter(printerIPAddress, printerPort, zplString)
        zplStringAux = zplString
        console.log('ZPL_FINAL:' + sendToPrinterAllLabels)
        console.log('*******************************************************************************************')

        await this.timer(4000) // then the created Promise can be awaited

        if (i === totalLabelsToPrint) {
          this.isLoading = false
          this.$refs['modal-paint-2'].show()
        }
      }

    },
    async launchSecondModal () {
      this.$refs['modal-paint'].hide()
      this.modal_action = false

      let data = this.first_modal_action_object
      console.log('launchSecondModal')
      console.log('data inside modal: ' + JSON.stringify(data))

      let zplString = this.first_modal_action_object.zpl_to_print
      let printerIPAddress = this.first_modal_action_object.printer_ip_address
      let printerPort = this.first_modal_action_object.printer_port
      let labelBeingPrinted = this.first_modal_action_object.labelBeingPrinted
      let uniqueId = this.first_modal_action_object.uniqueId
      let orderId = this.first_modal_action_object.orderId
      let customerProductId = this.first_modal_action_object.customerProductId
      let articleLabelAlreadyPrinted = this.first_modal_action_object.articleLabelAlreadyPrinted
      let boxLabelAlreadyPrinted = this.first_modal_action_object.boxLabelAlreadyPrinted
      let labelHasCounter = this.first_modal_action_object.labelHasCounter
      let totalLabelsToPrint = this.first_modal_action_object.totalLabelsToPrint
      let quantityArticleLabels = this.first_modal_action_object.quantityArticleLabels

      if (this.actiontype === 'article_label') {
        this.modal = {
          title: 'Imprimir Etiquetas',
          content: 'As etiquetas de Artigo foram impressas com sucesso?',
          ok_button: 'Sim'
        }
      } else {
        this.modal = {
          title: 'Imprimir Etiquetas',
          content: 'As etiquetas de Caixa foram impressas com sucesso?',
          ok_button: 'Sim'
        }
      }
      // this.$refs['modal-paint-2'].show()

      // START OF THE PRINT

      console.log('labelHasCounter: ' + labelHasCounter)

      if (labelHasCounter === 'false' || (labelHasCounter === 'true' && this.actiontype === 'article_label')) {
        this.sendZplToPrinter(printerIPAddress, printerPort, zplString)

        // IF THE ARTICLE LABELS WHERE ALREADY PRINTED, THEN THIS RECORD SHOULD BE DELETED
        if (labelBeingPrinted === 'box') {
          if (articleLabelAlreadyPrinted === 'true') {
            // operationsToExecute = ['/deleteLabelsToPrint']
            // dataToDelete = [{ 'UNIQUE_ID': uniqueId, 'ORDER_ID': orderId, 'CUSTOMER_PRODUCT_ID': customerProductId }]
            this.operations_to_execute_after_print = {
              'operationsToExecute': ['deleteLabelsToPrint'],
              'dataToDelete': [{ 'UNIQUE_ID': uniqueId, 'ORDER_ID': orderId, 'CUSTOMER_PRODUCT_ID': customerProductId }]
            }
          } else {
            // operationsToExecute = ['/updateLabelAlreadyPrinted']
            // dataToDelete = [{ 'COLUMN_TO_UPDATE': 'BOX_LABEL_ALREADY_PRINTED', 'ORDER_ID': orderId, 'CUSTOMER_PRODUCT_ID': customerProductId }]
            this.operations_to_execute_after_print = {
              'operationsToExecute': ['updateLabelAlreadyPrinted'],
              'dataToDelete': [{ 'COLUMN_TO_UPDATE': 'BOX_LABEL_ALREADY_PRINTED', 'ORDER_ID': orderId, 'CUSTOMER_PRODUCT_ID': customerProductId }]
            }
          }
        }

        if (labelBeingPrinted === 'article') {
          // IF THE BOX LABELS WHERE ALREADY PRINTED, THEN THIS RECORD SHOULD BE DELETED
          if (boxLabelAlreadyPrinted === 'true') {
            // operationsToExecute = ['/deleteLabelsToPrint']
            // dataToDelete = [{ 'UNIQUE_ID': uniqueId, 'ORDER_ID': orderId, 'CUSTOMER_PRODUCT_ID': customerProductId }]
            this.operations_to_execute_after_print = {
              'operationsToExecute': ['deleteLabelsToPrint'],
              'dataToDelete': [{ 'UNIQUE_ID': uniqueId, 'ORDER_ID': orderId, 'CUSTOMER_PRODUCT_ID': customerProductId }]
            }
          } else {
            // operationsToExecute = ['/updateLabelAlreadyPrinted']
            // dataToDelete = [{ 'COLUMN_TO_UPDATE': 'ARTICLE_LABEL_ALREADY_PRINTED', 'ORDER_ID': orderId, 'CUSTOMER_PRODUCT_ID': customerProductId }]
            this.operations_to_execute_after_print = {
              'operationsToExecute': ['updateLabelAlreadyPrinted'],
              'dataToDelete': [{ 'COLUMN_TO_UPDATE': 'ARTICLE_LABEL_ALREADY_PRINTED', 'ORDER_ID': orderId, 'CUSTOMER_PRODUCT_ID': customerProductId }]
            }
          }
        }
      } else { // THE LABEL HAS A COUNTER
        let digitsForPadding = totalLabelsToPrint.toString().length

        console.log('THE LABEL HAS A COUNTER')
        // Returns a Promise that resolves after "ms" Milliseconds

        await this.executeCycleToPrintLabels(zplString, totalLabelsToPrint, digitsForPadding, printerIPAddress, printerPort)

        // IF THE ARTICLE LABELS WHERE ALREADY PRINTED, THEN THIS RECORD SHOULD BE DELETED
        if (labelBeingPrinted === 'box') {
          if (articleLabelAlreadyPrinted === 'true') {
            // operationsToExecute = ['/deleteLabelsToPrint']
            // dataToDelete = [{ 'UNIQUE_ID': uniqueId, 'ORDER_ID': orderId, 'CUSTOMER_PRODUCT_ID': customerProductId }]
            this.operations_to_execute_after_print = {
              'operationsToExecute': ['deleteLabelsToPrint'],
              'dataToDelete': [{ 'UNIQUE_ID': uniqueId, 'ORDER_ID': orderId, 'CUSTOMER_PRODUCT_ID': customerProductId }]
            }
          } else {
            // operationsToExecute = ['/updateLabelAlreadyPrinted']
            // dataToDelete = [{ 'COLUMN_TO_UPDATE': 'BOX_LABEL_ALREADY_PRINTED', 'ORDER_ID': orderId, 'CUSTOMER_PRODUCT_ID': customerProductId }]
            this.operations_to_execute_after_print = {
              'operationsToExecute': ['updateLabelAlreadyPrinted'],
              'dataToDelete': [{ 'COLUMN_TO_UPDATE': 'BOX_LABEL_ALREADY_PRINTED', 'ORDER_ID': orderId, 'CUSTOMER_PRODUCT_ID': customerProductId }]
            }
          }
        }

        if (labelBeingPrinted === 'article') {
          // IF THE BOX LABELS WHERE ALREADY PRINTED, THEN THIS RECORD SHOULD BE DELETED
          if (boxLabelAlreadyPrinted === 'true') {
            // operationsToExecute = ['/deleteLabelsToPrint']
            // dataToDelete = [{ 'UNIQUE_ID': uniqueId, 'ORDER_ID': orderId, 'CUSTOMER_PRODUCT_ID': customerProductId }]
            this.operations_to_execute_after_print = {
              'operationsToExecute': ['deleteLabelsToPrint'],
              'dataToDelete': [{ 'UNIQUE_ID': uniqueId, 'ORDER_ID': orderId, 'CUSTOMER_PRODUCT_ID': customerProductId }]
            }
          } else {
            // operationsToExecute = ['/updateLabelAlreadyPrinted']
            // dataToDelete = [{ 'COLUMN_TO_UPDATE': 'ARTICLE_LABEL_ALREADY_PRINTED', 'ORDER_ID': orderId, 'CUSTOMER_PRODUCT_ID': customerProductId }]
            this.operations_to_execute_after_print = {
              'operationsToExecute': ['updateLabelAlreadyPrinted'],
              'dataToDelete': [{ 'COLUMN_TO_UPDATE': 'ARTICLE_LABEL_ALREADY_PRINTED', 'ORDER_ID': orderId, 'CUSTOMER_PRODUCT_ID': customerProductId }]
            }
          }
        }
      }

    // END OF THE PRINT
    },
    async executeLabelsPostOperations () {
      let operationsAndData = this.operations_to_execute_after_print
      console.log('operationsToExecute: ' + JSON.stringify(operationsAndData))
      console.log('operationsToExecute: ' + operationsAndData.operationsToExecute)
      console.log('dataToDelete: ' + JSON.stringify(operationsAndData.dataToDelete[0]))
      let urlParameters = Object.entries(operationsAndData.dataToDelete[0]).map(e => e.join('=')).join('&')
      await axios.post(sitebase + operationsAndData.operationsToExecute,
        urlParameters,
        {headers:
          {'Content-type': 'application/x-www-form-urlencoded'}
        }
      ).then(
        r => {
          console.log('r: ', r)
          if (r.status === 200) {
            console.log('success')
            this.$router.go(0) // Refresh the page
          } else {
            alert(r.errorText)
          }
        }
      )
      this.$refs['modal-paint-2'].hide()
    },
    replaceAll (str, map) {
      for (let key in map) {
        let str2 = str.split(key).join(map[key])
        str = str2
        str2 = null
      }
      return str
    },
    eanCheckDigit (barCode) {
      let result = 0
      let rs = barCode.reverse()
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
      request.send(zpl)
      // request.done;

      console.log('end')
    },
    async getLabelToPrintDetails (customerProductId) {
      let data = ''
      await axios({method: 'GET', 'url': sitebase + 'labelToPrintForProduct/' + customerProductId}).then(result => {
        // console.log(sitebase + 'labelToPrintForProduct/' + 143139)
        data = result.data
        // console.log(result.data)
      }, error => {
        console.error(error)
      })
      return data
    },
    async printLabelArticle (uniqueId, customerProductId, orderId, quantityArticleLabels, boxLabelAlreadyPrinted) {
      // console.log(uniqueId)
      // console.log(customerProductId)

      let labelToPrintDetails = await this.getLabelToPrintDetails(customerProductId)
      // let K = JSON.parse(JSON.stringify(labelToPrintDetails))
      // console.log('X: ' + JSON.stringify(labelToPrintDetails))
      // console.log('CUSTOMER_PRODUCT_ID: ' + labelToPrintDetails[0].CUSTOMER_PRODUCT_ID)
      // console.log('XPTO')
      let barCodeNumber = labelToPrintDetails[0].Bar_Code_Tech_Sheet
      let productNameForLabel = labelToPrintDetails[0].PRODUCT_NAME_FOR_LABEL
      let ZPLString = labelToPrintDetails[0].ZPL_STRING_ARTICLE
      let zplStringTest = labelToPrintDetails[0].ZPL_STRING_ARTICLE
      let ZPL_STRING_ARTICLE_2_COLUMNS_1_LABEL = labelToPrintDetails[0].ZPL_STRING_ARTICLE_2_COLUMNS_1_LABEL
      let ZPL_STRING_ARTICLE_2_COLUMNS_1_LABEL_TEST = labelToPrintDetails[0].ZPL_STRING_ARTICLE_2_COLUMNS_1_LABEL
      let ZPL_STRING_ARTICLE_2_COLUMNS_MULTIPLE_LABEL = labelToPrintDetails[0].ZPL_STRING_ARTICLE_2_COLUMNS_MULTIPLE_LABEL
      let ZPL_STRING_ARTICLE_2_COLUMNS_MULTIPLE_LABEL_TEST = labelToPrintDetails[0].ZPL_STRING_ARTICLE_2_COLUMNS_MULTIPLE_LABEL
      let printerIPAddress = labelToPrintDetails[0].ARTICLE_PRINTER_IP_ADDRESS
      let printerPort = labelToPrintDetails[0].ARTICLE_PRINTER_PORT
      let labelHasCounter = labelToPrintDetails[0].LABEL_HAS_COUNTER
      let numberLabelsOnArticle = labelToPrintDetails[0].NUMBER_LABELS_ON_ARTICLE
      let labelsWith2Columns = labelToPrintDetails[0].ARTICLE_LABEL_WITH_2_COLUMNS
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
        quantityArticleLabels = quantityArticleLabels * numberLabelsOnArticle
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

      if (labelsWith2Columns === 'false') {
        // The _PRINT_QUANTITY in the map can only be changed directly
        map._PRINT_QUANTITY = quantityArticleLabels
        sendToPrinter = this.replaceAll(ZPLString, map)
        console.log('labelsWith2Columns === false: sendToPrinter: ' + sendToPrinter)
        sendToPrinterTest = this.replaceAll(zplStringTest, mapTestLabel)
      } else {
        if (quantityArticleLabels === 1) {
          console.log('quantityArticleLabels === 1: sendToPrinter: ' + sendToPrinter)
          // ZPL_STRING_ARTICLE_2_COLUMNS_1_LABEL  --> Only 1 label is written and the other is blank
          // ZPL_STRING_ARTICLE_2_COLUMNS_MULTIPLE_LABEL --> Both Labels are written
          map._PRINT_QUANTITY = 1
          mapTestLabel._PRINT_QUANTITY = 2
          sendToPrinter = this.replaceAll(ZPL_STRING_ARTICLE_2_COLUMNS_1_LABEL, map)
          sendToPrinterTest = this.replaceAll(ZPL_STRING_ARTICLE_2_COLUMNS_1_LABEL_TEST, mapTestLabel)
          return
        }
        if (quantityArticleLabels % 2 === 0) {
          console.log('quantityArticleLabels: ' + quantityArticleLabels)
          map._PRINT_QUANTITY = quantityArticleLabels / 2
          mapTestLabel._PRINT_QUANTITY = 2
          sendToPrinter = this.replaceAll(ZPL_STRING_ARTICLE_2_COLUMNS_MULTIPLE_LABEL, map)
          console.log('quantityArticleLabels % 2 === 0: sendToPrinter: ' + sendToPrinter)
          sendToPrinterTest = this.replaceAll(ZPL_STRING_ARTICLE_2_COLUMNS_1_LABEL_TEST, mapTestLabel)
        }
        if (quantityArticleLabels % 2 !== 0) {
          console.log('quantityArticleLabels: ' + quantityArticleLabels)
          map._PRINT_QUANTITY = Math.ceil(quantityArticleLabels / 2)
          mapTestLabel._PRINT_QUANTITY = 2
          sendToPrinter = this.replaceAll(ZPL_STRING_ARTICLE_2_COLUMNS_MULTIPLE_LABEL_TEST, map)
          console.log('quantityArticleLabels % 2 !== 0: sendToPrinter: ' + sendToPrinter)
          sendToPrinterTest = this.replaceAll(ZPL_STRING_ARTICLE_2_COLUMNS_1_LABEL_TEST, mapTestLabel)

          map._PRINT_QUANTITY = 1
          sendToPrinter = sendToPrinter + this.replaceAll(ZPL_STRING_ARTICLE_2_COLUMNS_1_LABEL, map)
        }
      }

      this.sendZplToPrinter(printerIPAddress, printerPort, sendToPrinterTest)

      this.first_modal_action_object = {
        'zpl_to_print': sendToPrinter,
        'printer_ip_address': printerIPAddress,
        'printer_port': printerPort,
        'labelBeingPrinted': 'article',
        'uniqueId': uniqueId,
        'orderId': orderId,
        'customerProductId': customerProductId,
        'articleLabelAlreadyPrinted': 'false',
        'boxLabelAlreadyPrinted': boxLabelAlreadyPrinted,
        'labelHasCounter': labelHasCounter,
        'totalLabelsToPrint': quantityArticleLabels,
        'quantityArticleLabels': quantityArticleLabels
      }

      this.launchModal('article_label')

      // this.first_modal_action_object = {}
    },
    async printBoxLabels (uniqueId, customerProductId, orderId, quantityBoxLabels, articleLabelAlreadyPrinted) {
      let labelToPrintDetails = await this.getLabelToPrintDetails(customerProductId)

      let barCodeNumber = labelToPrintDetails[0].Bar_Code_Tech_Sheet
      let qtyByBox = labelToPrintDetails[0].Qty_By_Box
      let productNameForLabel = labelToPrintDetails[0].PRODUCT_NAME_FOR_LABEL
      let boxBarCodeType = labelToPrintDetails[0].BOX_BARCODE_TYPE
      let zplStringTestLabel = labelToPrintDetails[0].ZPL_STRING_BOX
      let zplStringAllLabels = labelToPrintDetails[0].ZPL_STRING_BOX
      let printerIPAddress = labelToPrintDetails[0].BOX_PRINTER_IP_ADDRESS
      let printerPort = labelToPrintDetails[0].BOX_PRINTER_PORT
      let labelHasCounter = labelToPrintDetails[0].LABEL_HAS_COUNTER
      let numberLabelsOnArticle = labelToPrintDetails[0].NUMBER_LABELS_ON_ARTICLE
      let numberLabelsOnBox = labelToPrintDetails[0].NUMBER_LABELS_ON_BOX
      let FullEan = ''
      let checkDigit = ''
      let EanWithCheckDigit = ''
      let quantityFull = ''
      let sendToPrinterTestLabel = ''
      let sendToPrinterAllLabels = ''

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

          sendToPrinterTestLabel = this.replaceAll(zplStringTestLabel, mapTestLabel)

          sendToPrinterAllLabels = this.replaceAll(zplStringAllLabels, map)

          this.sendZplToPrinter(printerIPAddress, printerPort, sendToPrinterTestLabel)
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

          sendToPrinterTestLabel = this.replaceAll(zplStringTestLabel, mapTestLabel)

          sendToPrinterAllLabels = this.replaceAll(zplStringAllLabels, map)

          this.sendZplToPrinter(printerIPAddress, printerPort, sendToPrinterTestLabel)
        }

        this.first_modal_action_object = {
          'zpl_to_print': sendToPrinterAllLabels,
          'printer_ip_address': printerIPAddress,
          'printer_port': printerPort,
          'labelBeingPrinted': 'box',
          'uniqueId': uniqueId,
          'orderId': orderId,
          'customerProductId': customerProductId,
          'articleLabelAlreadyPrinted': articleLabelAlreadyPrinted,
          'boxLabelAlreadyPrinted': 'false',
          'labelHasCounter': labelHasCounter,
          'totalLabelsToPrint': quantityBoxLabels,
          'quantityArticleLabels': quantityBoxLabels,
          'quantity_box_labels': quantityBoxLabels
        }

        this.launchModal('box_label')
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

        sendToPrinterTestLabel = this.replaceAll(zplStringTestLabel, mapTestLabel)

        sendToPrinterAllLabels = this.replaceAll(zplStringAllLabels, map)

        this.sendZplToPrinter(printerIPAddress, printerPort, sendToPrinterTestLabel)

        this.first_modal_action_object = {
          'zpl_to_print': sendToPrinterAllLabels,
          'printer_ip_address': printerIPAddress,
          'printer_port': printerPort,
          'labelBeingPrinted': 'box',
          'uniqueId': uniqueId,
          'orderId': orderId,
          'customerProductId': customerProductId,
          'articleLabelAlreadyPrinted': articleLabelAlreadyPrinted,
          'boxLabelAlreadyPrinted': 'false',
          'labelHasCounter': labelHasCounter,
          'totalLabelsToPrint': quantityBoxLabels,
          'quantityArticleLabels': quantityBoxLabels
        }

        this.launchModal('box_label')
      }
    }
  }
}
</script>

<style lang="stylus">

@import "../scss/globalvariables.scss";

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
    margin-bottom:5px;
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
    padding: 5px;
    margin-top : 5px;
    margin-bottom : 5px;
    background-color: #fff;
}

li.order-item-detail {
    display: table-cell;
    text-align: left;
}

.outer-wrap {
    box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.25);
    border-radius: 0px;
    background-color: #ededed;
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

.flex-right{
    justify-content: flex-end;
    display: flex;
    padding-right:30px;
    padding-left: 0px !important;
}

</style>
