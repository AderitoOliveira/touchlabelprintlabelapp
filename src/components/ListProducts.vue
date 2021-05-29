<template>
  <div id="order">
    <div class="container">
      <div class="outer-wrap">
        <div class="row">
          <div class="col-md-12">
              <ul id="table-header">
                <div class="row">
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
            <div class="search-wrap">
                    <input type="text" class="form-control"  v-on:keyup="updateLen" v-model="search" placeholder="Pesquise pelo número do produto...">
            </div>
          </div>
        </div>
              <div id="card-content">
                <div class="row">
                    <div class="col-md-3" v-for="product in products" :key="product.CUSTOMER_PRODUCT_ID">
                        <div class="item-card">
                                <div class="image-wrapper">
                                    <div class="image-inner"
                                        v-bind:style="{ 'background-image': 'url(' + image_base + product.IMAGE_NAME + ')' }">
                                    </div>
                                </div>
                                <div class="info-wrapper">
                                    <div class="name">
                                        {{product.PRODUCT_NAME}}
                                    </div>
                                    <div class="card-actions">
                                        <a class="btn btn-card" ng-click="removeRow(client.ClientID)"><img
                                                src="../assets/icons/card-info.svg" width="30px" height="30px" /></a>
                                    </div>
                                </div>
                                <div class="item-hover">
                                    <div class="top-overlay">
                                        <div class="item-name">
                                            {{product.PRODUCT_NAME}}
                                        </div>
                                        <div class="item-text item-reference ref-int">
                                            <span class="label">Referência Interna</span>
                                            {{product.INTERNAL_PRODUCT_ID}}
                                        </div>
                                        <div class="item-text item-reference ref-ext">
                                            <span class="label">Referência Cliente</span>
                                            {{product.CUSTOMER_PRODUCT_ID}}
                                        </div>
                                        <div class="item-text item-price">
                                            <div class="price-half price-left">
                                                <span class="label">Preço 1</span>
                                                {{product.PRICE_EURO_1}}€
                                            </div>
                                            <div class="price-half price-right">
                                                <span class="label">Preço 2</span>
                                                {{product.PRICE_EURO_2}}€
                                            </div>
                                        </div>
                                    </div>
                                    <div class="info-wrapper hover-actions">
                                        <a class="btn btn-card btn-left"
                                            @click="printProductLabel(product.CUSTOMER_PRODUCT_ID, product.PRODUCT_NAME)">
                                            <img src="../assets/icons/card-print.svg" width="30px" height="30px" />
                                        </a>
                                        <a class="btn btn-card btn-right"
                                            @click="productDetail(product.CUSTOMER_PRODUCT_ID)">
                                            <img src="../assets/icons/card-edit.svg" width="30px" height="30px" />
                                        </a>
                                    </div>
                                </div>
                            </div>
                    </div>
                </div>
            </div>
            <!--/ul-->
          <!--/div -->
        <!-- /div-->
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
  sitebase = 'http://' + process.env.IP_ADDRESS + ':8080/',
  imageBase = 'http://' + process.env.IP_ADDRESS + ':8080/images/'
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
    filterProducts: function () {
      if (this.search && this.search != this.currentSearch) {
          this.currentSearch = this.search;
        console.log(this.currentSearch)
        console.log(this.search)
        axios({ method: 'GET', 'url': sitebase + searchProduct + this.search }).then(result => {
            this.products = result.data
            return this.products
            }, error => {
            console.error(error)
            })
      }
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
    updateLen: _.debounce(
      function () {
        this.searchFilterDebounce()
      }, 800),
    searchFilterDebounce () {
      alert(this.search)
      if (this.search !== '') {
        axios({ method: 'GET', 'url': sitebase + searchProduct + encodeURIComponent(this.search) }).then(result => {
          this.products = result.data;
          return this.products
          }, error => {
              console.error(error)
         })
         } else {
             axios({ method: 'GET', 'url': sitebase + getProducts }).then(result => {
                this.products = result.data
                }, error => {
                console.error(error)
            })
          }
    },
    printProductLabel (customerProductId) {
      alert(customerProductId)
      this.$router.push({ name: 'ProductPrintLabels', params: { customerProductId } })
    }
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

<!-- -->

.header-actions {
 border-radius: 4px;
 box-shadow: inset 0 -1px 2px 0 rgba(0, 0, 0, 0.25);
 background-color: #fff;
 border: solid 1px #cacbcc;
 overflow: hidden;
}

button.button {
 font-size: 18px;
 font-weight: normal;
 font-style: normal;
 font-stretch: normal;
 line-height: normal;
 letter-spacing: normal;
 color: #fff;
 border: none;
 padding: 16px 0px;
 width: 100%;
}

button.button span.button-inner-wrap {
 margin-bottom: -4px;
}

button.button span.button-inner-wrap img {
 float: left;
 margin-left: 15px;
}

button.button span.button-inner-wrap .btn-text {
 float: left;
 margin-bottom: -10px;
 margin-left: 6px;
}

button.button.add {
 background: #27ae60;
}

button.button.multiple {
 width: 50%;
 float: left;
}

button.button.multiple img {
 margin-right: 6px;
}

button.button.print {
 background: #2755ae;
}

.search-wrap {
 width: 100%;
 float: left;
}

.search-wrap input {
 margin: 0 auto;
 width: 100%;
 float: left;
 height: 100%;
 border: none;
 padding: 14px 4px;
 position: relative;
 z-index: 0;
 background-color: #fafbfc;
 box-shadow: inset 2px 0 2px 0 rgba(0, 0, 0, 0.25);
 font-size: 18px;
 font-weight: normal;
 font-style: normal;
 font-stretch: normal;
 line-height: normal;
 letter-spacing: normal;
 color: rgba(0, 0, 0, 0.75);
}

#card-content {
 padding-top: 36px;
}

#card-content .item-card {
 background-color: #fff;
 box-shadow: 0 4px 4px 0 rgba(0, 0, 0, 0.25);
 border-radius: 10px;
 overflow: hidden;
 position: relative;
 margin-bottom: 36px;
}

#card-content .item-card .image-wrapper {
 z-index: 0;
}

#card-content .item-card .image-wrapper .image-inner {
 width: 100%;
 padding-top: 100%;
 height: 0;
 background-size: cover;
 background-position: center;
}

#card-content .item-card .info-wrapper {
 position: absolute;
 bottom: 0px;
 z-index: 1;
 background: #fff;
 width: 100%;
 float: left;
 padding: 9px 12px;
 min-height: 48px;
}

#card-content .item-card .info-wrapper .name {
 max-width: calc(100% - 30px);
 float: left;
 font-size: 18px;
 line-height: 30px;
 letter-spacing: normal;
 color: #222;
 width: 100%;
}

#card-content .item-card .info-wrapper .card-actions {
 width: 30px;
 float: right;
 position: absolute;
 right: 12px;
 bottom: 9px;
}

#card-content .item-card .info-wrapper .card-actions .btn-card {
 padding: 0px;
 border: 0px;
}

#card-content .item-card .item-hover {
 position: absolute;
 width: 100%;
 height: 100%;
 top: 100%;
}

#card-content .item-card .item-hover .top-overlay {
 background-color: rgba(0, 0, 0, 0.75);
 height: 100%;
 color: #fff;
 padding: 20px 12px 48px;
}

#card-content .item-card .item-hover .top-overlay .item-name {
 font-size: 22px;
 min-height: 55px;
 width: 100%;
 float: left;
}

#card-content .item-card .item-hover .top-overlay .price-half {
 width: 50%;
 float: left;
}

#card-content .item-card .item-hover .top-overlay .item-text {
 font-size: 18px;
 width: 100%;
 float: left;
 margin: 3px 0px;
}

#card-content .item-card .item-hover .top-overlay .item-text span.label {
 font-size: 14px;
 width: 100%;
 float: left;
 text-align: left;
 font-weight: normal;
 padding: 0px;
}

#card-content .item-card .item-hover .btn-card {
 border: 0px;
 padding: 0px;
}

#card-content .item-card .item-hover .btn-left {
 float: left;
}

#card-content .item-card .item-hover .btn-right {
 float: right;
}

#card-content .item-card:hover .item-hover {
 position: absolute;
 width: 100%;
 height: 100%;
 top: 0px;
 z-index: 1;
}
</style>
