import Vue from 'vue';
import Vuex from 'vuex';
Vue.use(Vuex);

import park from './modules/park'

import user from './modules/user'
//implement state in the application
export default new Vuex.Store({
  modules: {
    user,
    park
  },
  strict: true,
})