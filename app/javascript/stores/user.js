const User = {
  namespaced: true,
  state: {
    user: {},
  },
  mutations:{
    SET_USER(state,data){
      state.user = data;
      return state;
    }
  },
  actions:{
    
  }
}

export default User;