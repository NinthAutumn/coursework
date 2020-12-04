<template>
  <div class="login-card">
    <card-style class="login-card__form">
      <h1 class="login-card__title">Login</h1>
      <label for>Username・Email</label>
      <input-style
        type="text"
        theme="white"
        placeholder="Password"
      ></input-style>
      <label for>Password</label>
      <input-style
        type="password"
        theme="white"
        placeholder="Password"
      ></input-style>
      <div class="flex-divider">
        <button-card style="margin-left: auto">Login</button-card>
      </div>

      <p class="login-card__password-forgot">Forgot Password?</p>
    </card-style>
  </div>
</template>
<script >
export default {
  components: {
    ButtonCard: () => import("./Style/Button.vue"),
    CardStyle: () => import("./Style/Card.vue"),
    InputStyle: () => import("./Style/Input.vue"),
  },
};
</script>
<style lang="scss">
.login-card {
  &__form {
    margin-top: 1rem;
    @media screen and (min-width: 700px) {
      max-width: 50rem;
      margin: 0 auto;
    }
  }
  &__title {
    margin: 1rem 0;
    text-align: center;
  }
  .flex-divider {
    margin: 1rem 0;
  }
  &__password-forgot {
    margin: 2rem 0;
    text-align: center;
    font-size: 1.2rem;
    // width: 100%;
  }
}
</style>
