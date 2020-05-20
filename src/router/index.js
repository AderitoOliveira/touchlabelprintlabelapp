import Vue from 'vue'
import Router from 'vue-router'
import ListOrders from '@/components/ListOrders'

Vue.use(Router)

export default new Router({
  base: '/',
  assetsPublicPath: 'file:///android_asset/www/dist/index.html',
  routes: [
    {
      path: '/',
      name: 'ListOrders',
      component: ListOrders
    }
  ]
})
