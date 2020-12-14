<template>
  <div id="app">
    <!-- Horizontal Nav bar that stands at the top of all the pages -->
    <horizontal-bar></horizontal-bar>
    <!-- Yield in  vue router -->
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
    // When the app start check if there is cookie and add authenticate user
    if (Cookies.get("Authorization")) {
      await this.$store.dispatch("user/fetchUserSelf");
    }
  },
};
</script>