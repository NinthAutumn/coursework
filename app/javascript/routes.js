import VueRouter from 'vue-router'

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
    path: '/parks',
    component: () => import("./parts/parks")
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
]

// 3. Create the router instance and pass the `routes` option
// You can pass in additional options here, but let's
// keep it simple for now.
const router = new VueRouter({
  mode: 'history',
  routes // short for `routes: routes`
})

export default router;