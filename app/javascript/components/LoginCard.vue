<template>
  <div class="login-card">
    <!-- prevents default refreshing of the page and calls the loginhandler function on submit -->
    <form @submit.prevent="loginHandler">
      <card-style class="login-card__form">
        <h1 class="login-card__title">Login</h1>
        <label for>Email</label>
        <input
          v-model="form.email"
          placeholder="Email"
          class="input"
          required
          type="text"
          maxlength="100"
        />
        <label for>Password</label>
        <input
          class="input"
          type="password"
          v-model="form.password"
          maxlength="100"
          required
          placeholder="Password"
        />
        <div class="flex-divider">
          <button class="button button--primary button--round" type="submit">
            Login
          </button>
          <span v-if="error">{{ error }}</span>
        </div>

        <p class="login-card__password-forgot">Forgot Password?</p>
      </card-style>
    </form>
  </div>
</template>
<script >
export default {
  data: () => ({
    form: {
      email: "",
      password: "",
    },
    error: false,
  }),
  methods: {
    async loginHandler(e) {
      if (this.form.email.length > 100 || this.form.password.length > 100)
        return alert("Password or email cannot be longer than 100 characters");
      const { error } = await this.$store.dispatch("user/login", this.form);

      if (error) return (this.error = error);
      return this.$router.push("/");
    },
  },
  components: {
    // ButtonCard: () => import("./Style/Button.vue"),
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
      max-width: 80rem;
      margin: 0 auto;
    }
  }
  &__title {
    margin: 1rem 0;
    text-align: center;
  }
  .flex-divider {
    display: flex;
    align-items: center;
    justify-content: flex-end;
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
