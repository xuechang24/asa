import Vue from 'vue'
import Vuex from 'vuex'
// import user from "@/store/modules/user";

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    userName: ''
  },
  getters: {
  },
  mutations: {
    updateName(state, data) {
      state.userName = data
    }
  },
  actions: {
    updateName({commit, state}, data) {
      commit("updateName", data)
    }
  },
  modules: {

  }
})
