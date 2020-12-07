<template>
  <div class="user-parks">
    <h2>Add Your Own Park</h2>
    <div class="user-parks__list">
      <div class="user-parks__item">
        <img
          @click="$router.push('/parks/new')"
          src="/assets/plus-solid.svg"
          alt=""
          height="100"
          width="100"
        />
      </div>
      <div class="user-parks__item" v-for="park in parks" :key="park.id">
        {{ park }}
      </div>
    </div>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
export default {
  computed: {
    ...mapGetters({
      auth: "user/isAuth",
      user: "user/getAuth",
      parks: "park/getUserParks",
    }),
  },
  async mounted() {
    if (this.auth)
      await this.$store.dispatch("park/fetchUserParks", {
        user_id: this.user.id,
      });
  },
};
</script>

<style lang="scss">
@import "../../assets/stylesheets/variable";
.user-parks {
  &__item {
    img {
      cursor: pointer;
      color: $primary;
    }
  }
}
</style>
