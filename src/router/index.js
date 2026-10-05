import Vue from 'vue'
import Router from 'vue-router'
import ListOrders from '@/components/ListOrders'
import ListLabelsToPrint from '@/components/ListLabelsToPrint'
import ListProducts from '@/components/ListProducts'
import ProductPrintLabels from '@/components/ProductPrintLabels'

Vue.use(Router)

export default new Router({
  base: '/',
  assetsPublicPath: 'file:///android_asset/www/dist/index.html',
  routes: [
    {
      path: '/xpto',
      name: 'ListOrders',
      component: ListOrders
    },
    {
      path: '/',
      name: 'ListLabels',
      component: ListLabelsToPrint
    },
    {
      path: '/listProducts',
      name: 'ListProducts',
      component: ListProducts
    },
    {
      path: '/productLabel',
      name: 'ProductPrintLabels',
      component: ProductPrintLabels
    }
  ]
})
