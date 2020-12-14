import VueRouter from 'vue-router'


//client side routes list
const routes = [
  // { path: '/', component: ()=>import("./app") },
  {
    path: '/',
    component: () => import("./parts/home")
  },
  {
    path: '/contact',
    component: () => import("./parts/contact")
  },
  {
    path: '/parks/new',
    component: () => import("./parts/parks/new")
  },
  {
    path: '/parks/:id',
    component: () => import("./parts/parks/_id")
  },
  {
    path: '/parks/:id/update',
    component: () => import("./parts/parks/_id/update")
  },

  {
    path: '/auth/login',
    component: () => import("./parts/auth/login")
  },
  {
    path: '/auth/signup',
    component: () => import("./parts/auth/signup")
  },
  {
    path: '/users/:id',
    component: () => import("./parts/users/_id")
  },
  {
    path: '*',
    component: () => import("./parts/home")
  },
]

// 3. Creates the router instance and pass the `routes` option
const router = new VueRouter({
  mode: 'history',
  routes // short for `routes: routes`
})

export default router;