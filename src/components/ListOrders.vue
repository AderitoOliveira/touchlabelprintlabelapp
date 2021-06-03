<template>
  <div id="order">
    <div class="container">
      <div class="outer-wrap">
        <div class="row">
          <div class="col-md-12">
              <ul id="table-header">
                <div class="row">
                  <li class="table-header-item col-md-2">
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
                  </li>
                  <li class="table-header-item col-md-1">
                    <a class="search-toggle" @click="toggleSearch()">
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
            <div v-if="showSearch" class="search-wrap"><input type="text" class="form-control" v-model="search" placeholder="Pesquise pelo número da encomenda..."></div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <ul id="table-content" class="row">
              <li class="order-item col-md-12" v-bind:key="index + order.ORDER_ID" v-for="(order, index) in filterOrders">
                <a v-if=" order.STATUS != 'Fechada'" class="order-link" v-bind:href="'#/order/'+order.ORDER_ID">
                  <ul class="order-item-list row">
                    <li class="order-item-detail col-md-2"><div class="item-inner"><strong>{{order.ORDER_ID}}</strong></div></li>
                    <li class="order-item-detail col-md-2"><div class="item-inner">{{order.CLIENT_NAME}}</div></li>
                    <li class="order-item-detail col-md-3"><div class="item-inner">{{order.MODIFIED_DATE}}</div></li>
                    <li class="order-item-detail col-md-2"><div class="item-inner">{{order.QTY_ORDERED}} / <strong>{{order.QTY_PRODUCED}}</strong></div></li>
                    <li class="order-item-detail col-md-2"><div class="item-inner">{{order.STATUS}}</div></li>
                    <li class="order-item-detail col-md-1"><div class="item-inner"><a v-bind:href="'#/order/'+order.ORDER_ID"><img :src="icon"></a></div></li>
                  </ul>
                  <div class="status-wrap">
                    <div class="status-inner" :style="{width: Math.round(order.QTY_PRODUCED * 100 / order.QTY_ORDERED)+'%', background: 'hsl(calc('+Math.round(order.QTY_PRODUCED * 100 / order.QTY_ORDERED)+' * .9), 50%, 50%)'}"></div>
                  </div>
                </a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
// import { request } from 'http'

let sitebase

if (process.env.NODE_ENV === 'development') {
  sitebase = 'http://localhost:8080/'
} else {
  //sitebase = 'http://touchlabel-castanheira-dantas.e4ff.pro-eu-west-1.openshiftapps.com/'
  sitebase = 'http://192.168.1.17:8080/'
}

const getOrders = 'orders'

export default {
  name: 'ListOrders',
  data () {
    return {
      icon: 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAIISURBVHgB7VfLccJADJUJd0gHBhogHUAJqQB3EK45YSogVBDoIB3gDuIGIL7mhCvAeQ9kxqzXH8iMM5Phzeyw2ZX0JK0kgjMYDCZJkryJSFeaQeQ4ju/0+/0v/OFKs4jbKelut3OkASDQBB/dlvwR7sSNoX2NsOu6bLkht61Wy9Xj+HA4hFEUBXIFahGDkEQv2Hpi6XfcsVpjbD/gxBxORFU2K1MNgwsYZq9PpXzI8M6jLHRmcisxo+z1ep9KeAamXICoxliP7H3ucbY21H3q0kaRfUcb+mKA8C3hOUlNxTnkfJsh2OH5zHAyxBoj83FG7shnjRikCwvpKiVlKrH2uhbquM9sZBUwk4dqK89hHiBaT05FdAGkdK2kNOTL6U25photI5znKcSDzVElsVZvDpl28SzXqU5o00Xks0pieB3blLWHS5F9SwP5FrQQz+26x8FBLC13a3VuZFNEFpeVxEyppT3O6dICo6FYFyt9qgQTyWO13W5XOXtF7QSiDavSkPchZ82IDg3fOI5QlE+124mCiPqZfWgSQ/E9TSkd5B7DYmOSUpfDpejdrREbkfhiDIYaWKbpt9grjjgLvik87+m7xyWivFtStog0i1rfTvpt43HP1KKI+PbHFgER77jCkna6jdhwIsBHIL/E/X+u/0/MPt5Lc7+bUkQPnU7nW0djU+Qx+F5/ADN8+ahyQQG5AAAAAElFTkSuQmCC',
      orders: '',
      search: '',
      'showSearch': false
    }
  },
  mounted () {
    axios({ method: 'GET', 'url': sitebase + getOrders }).then(result => {
      this.orders = result.data
    }, error => {
      console.error(error)
    })
  },
  computed: {
    filterOrders: function () {
      let filtered = this.orders
      if (this.search) {
        filtered = this.orders.filter(
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

</style>
