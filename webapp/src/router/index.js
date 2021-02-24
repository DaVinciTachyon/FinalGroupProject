import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import ManageUsers from '../views/ManageUsers.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/users',
    name: 'ManageUsers',
    component: ManageUsers
  }
]

const router = new VueRouter({
  mode: 'history',
  routes,
  scrollBehavior (to) {
    if (to.hash) {
      return {
        selector: to.hash,
        behavior: 'smooth',
      }
    }
  }
})

export default router
