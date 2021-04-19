import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import ManageUsers from '../views/ManageUsers.vue'
import Login from '../views/Login.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/home',
    name: 'Home',
    component: Home
  },
  {
    path: '/users',
    name: 'ManageUsers',
    component: ManageUsers
  },
  {
    path: '/',
    name: 'Login',
    component: Login
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
