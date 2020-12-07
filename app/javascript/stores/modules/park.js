import $ from 'jquery'
const state = () => ({
  park: {},
  user_parks: [],
})

const getters = {
  getPark: (state) => state.park,
  getUserParks: state => state.user_parks
}

const mutations = {
  SET_PARK: (state, park) => state.park = park,
  SET_USER_PARKS: (state, parks) => state.user_parks = parks
}
const actions = {
  async fetchPark({
    commit
  }, id) {
    console.log(id)
    const park = await $.ajax(`/api/parks/${id}`).promise();
    commit('SET_PARK', park);
  },
  async fetchUserParks({
    commit
  }, {
    user_id,
    limit = 10,
    page = 1
  }) {
    const parks = await window.$.ajax(`/api/parks?user_id=${user_id}&limit=${limit}&page=${page}`).promise();
    commit('SET_USER_PARKS', parks)
  },
  async postPark({
    commit
  }, form) {
    const park = await window.$.ajax({
      method: 'POST',
      url: "/api/parks/new",
      data: {
        ...form
      },
      headers: {
        Authorization: Cookies.get('Authorization')
      }
    }).promise();
    commit('SET_PARK', park)
  }
}

export default {
  namespaced: true,
  state,
  getters,
  mutations,
  actions,
}