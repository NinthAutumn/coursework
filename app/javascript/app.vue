<template>
  <div id="app">
    <horizontal-bar></horizontal-bar>
    <router-view class="page"></router-view>
  </div>
</template>

<script>
import Cookies from "js-cookie";

import VueRouter from "vue-router";
export default {
  components: {
    VueRouter,
    HorizontalBar: () => import("./layout/HorizontalBar"),
  },
  async created() {
    //when the app start check if there is cookie and add authenticate user
    if (Cookies.get("Authorization")) {
      await this.$store.dispatch("user/fetchUserSelf");
    }
  },
};
</script>