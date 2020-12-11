import Cookies from 'js-cookie'
import $ from 'jquery'
// const $ = require('jquery');
const state = () => ({
  auth: {},
  loggedIn: false,
  user: {}
})

const getters = {
  isAuth: state => state.loggedIn,
  getAuth: state => state.auth,
  getUser: state => state.user
}

const mutations = {
  SET_AUTH(state, data) {
    state.auth = data;
    state.loggedIn = true;
  },
  SET_USER: (state, user) => state.user = user
}
const actions = {
  async fetchUserSelf({
    commit
  }) {
    try {
      let user = await $.ajax(`/api/users/self/show`, {
        headers: {
          Authorization: Cookies.get('Authorization')
        }
      }).promise();
      commit('SET_AUTH', user);
    } catch (error) {
      Cookies.remove('Authorization')
      return
    }

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
            email: form.email,
            password: form.password
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
  },
  async fetchUser({
    commit
  }, id) {
    try {
      const user = await $.ajax(`/api/users/${id}`).promise();
      commit('SET_USER', user)
    } catch (error) {

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