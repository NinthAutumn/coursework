<template>
  <div class="horizontal-bar">
    <div class="horizontal-bar__content">
      <router-link tag="div" to="/" class="logo"> Car Park </router-link>
      <router-link to="/contact" class="contact"> Contact </router-link>
      <div v-if="!auth">
        <router-link to="/auth/signup" class="signup"> Sign Up </router-link>
        <router-link to="/auth/login" class="login"> Login </router-link>
      </div>
      <div v-else>
        <router-link
          :to="`/users/${user.id}`"
          tag="div"
          style="display: flex; align-items: center; cursor: pointer"
        >
          <img
            class="avatar"
            src="/assets/avatar.png"
            height="30"
            width="30"
            alt="user avatar"
            style="margin-right: 1rem"
          />
          <p>{{ user.username }}</p>
        </router-link>
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
    }),
  },
};
</script>

<style lang="scss">
@import "../../assets/stylesheets/variable";

.horizontal-bar {
  .contact {
    font-size: 1.4rem;
    // cursor
  }
  .login {
    color: $secondary;
    font-size: 1.4rem;
    padding: 0.5rem 2rem;
    border: 1px solid $secondary;
    font-weight: bold;
    margin-left: 1rem;
    border-radius: 0.5rem;
  }
  .signup {
    border-radius: 0.5rem;
    font-size: 1.4rem;
    margin-left: 2rem;
    padding: 0.5rem 2rem;
    border: 1px solid $primary;
    font-weight: bold;
  }
  z-index: 5;
  position: fixed;
  top: 0;
  left: 0;
  height: 4rem;
  width: 100%;
  display: flex;
  background: white;
  align-items: center;
  border-bottom-left-radius: 1.5rem;
  border-bottom-right-radius: 1.5rem;
  box-shadow: (
    rgba(0, 0, 0, 0) 0px 0px 0px 0px,
    rgba(0, 0, 0, 0) 0px 0px 0px 0px,
    rgba(0, 0, 0, 0.12) 0px 1px 1px 0px,
    rgba(60, 66, 87, 0.16) 0px 0px 0px 1px,
    rgba(0, 0, 0, 0) 0px 0px 0px 0px,
    rgba(0, 0, 0, 0) 0px 0px 0px 0px,
    rgba(60, 66, 87, 0.08) 0px 2px 5px 0px
  );
  &__content {
    display: flex;
    width: 100%;
    justify-content: space-between;
    align-items: center;
    padding: 0 1rem;
  }
}
</style>
