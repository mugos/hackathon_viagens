// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import VueRouter from 'vue-router'
import VueResource from 'vue-resource'

//
Vue.use(VueRouter)
Vue.use(VueResource)

//
import store from './store'

// Pages
import ChatPage from './pages/ChatPage'
import MatchPage from './pages/MatchPage'

// Routes
const routes = [
  { path: '/', component: ChatPage },
  { path: '/match', component: MatchPage }
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
