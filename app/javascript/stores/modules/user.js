import Cookies from 'js-cookie'

const state = () => ({
   auth:{},
 })

 const getters = {
  isAuth:state=>state.auth.id? true:false
}

 const mutations = {
  SET_AUTH(state,data){
    state.auth = data;
  }
}
 const actions = {
  async login({commit},form){
    try {
      let token = await window.$.ajax({
        method: "POST",
        url: "/api/auth/login",
        data: { auth: { ...form } },
      })
      if(!token) return {error:"failed to login"}
      Cookies.set('Authorization', `Bearer ${token.jwt}`);
      let user = await window.$.ajax(`/api/users/self/show`,{headers:{
        Authorization:Cookies.get('Authorization')
      }});
      
      commit('SET_AUTH',user);
      return {error:false}
    } catch (error) {
      return {error:"failed to login"}
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