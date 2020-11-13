import VueRouter from 'vue-router'

const routes = [
  // { path: '/', component: ()=>import("./app") },
  { path: '/', component: ()=>import("./parts/home") },
]

// 3. Create the router instance and pass the `routes` option
// You can pass in additional options here, but let's
// keep it simple for now.
const router = new VueRouter({
  mode: 'history',
  routes // short for `routes: routes`
})

export default router;