// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import VueRouter from 'vue-router'

//
Vue.use(VueRouter)

//
import store from './store'

// Pages
import HomePage from './pages/HomePage'

// Routes
const routes = [
  { path: '/', component: HomePage }
]

// Create the router
const router = new VueRouter({
  routes
})

/* eslint-disable no-new */
new Vue({
  el: '#app',
  store,
  router,
  render: h => h(App)
})
