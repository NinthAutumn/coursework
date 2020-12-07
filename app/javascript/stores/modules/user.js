import Cookies from 'js-cookie'
import $ from 'jquery'
// const $ = require('jquery');
const state = () => ({
  auth: {},
  loggedIn: false
})

const getters = {
  isAuth: state => state.loggedIn,
  getAuth: state => state.auth
}

const mutations = {
  SET_AUTH(state, data) {
    state.auth = data;
    state.loggedIn = true;
  }
}
const actions = {
  async fetchUserSelf({
    commit
  }) {
    let user = await $.ajax(`/api/users/self/show`, {
      headers: {
        Authorization: Cookies.get('Authorization')
      }
    }).promise();
    commit('SET_AUTH', user);
  },
  async login({
    commit
  }, form) {
    try {
      let token = await $.ajax({
        method: "POST",
        url: "/api/auth/login",
        data: {
          auth: {
            ...form
          }
        },
      })
      if (!token) return {
        error: "failed to login"
      }
      Cookies.set('Authorization', `Bearer ${token.jwt}`);
      let user = await $.ajax(`/api/users/self/show`, {
        headers: {
          Authorization: Cookies.get('Authorization')
        }
      }).promise();

      commit('SET_AUTH', user);
      return {
        error: false
      }
    } catch (error) {
      return {
        error: "failed to login"
      }
    }
  },
  async signup({
    commit
  }, form) {
    try {
      let user = await $.ajax({
        method: "POST",
        url: "/api/auth/signup",
        data: {
          ...form
        },
      }).promise()
      commit('SET_AUTH', user);
      let token = await $.ajax({
        method: "POST",
        url: "/api/auth/login",
        data: {
          auth: {
            email: this.form.email,
            password: this.form.password
          }
        },
      }).promise()
      if (!token) return {
        error: "failed to login"
      }
      Cookies.set('Authorization', `Bearer ${token.jwt}`);
      return {
        error: false
      }
    } catch (error) {
      return {
        error
      }
    }
  }
}
export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions
}