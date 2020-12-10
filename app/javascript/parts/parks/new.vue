<template>
  <div class="new-park">
    <form @submit.prevent="parkHandler" class="new-park__form">
      <card-style>
        <h1>Create new Park</h1>
        <label for>Name*</label>
        <input v-model="form.name" type="text" class="input" />
        <label for>Description*</label>
        <textarea
          v-model="form.description"
          name=""
          id=""
          cols="30"
          rows="10"
        ></textarea>
        <label for="">Avatar Image URL*</label>
        <input v-model="form.avatar" type="text" class="input" />
        <label for="">Cover Image URL*</label>
        <input v-model="form.cover" type="text" class="input" />
        <label for="">Address Line 1*</label>
        <input v-model="form.address_line_1" type="text" class="input" />
        <label for="">Address Line 2</label>
        <input v-model="form.address_line_2" type="text" class="input" />
        <label for="">Post Code</label>
        <input v-model="form.post_code" type="text" class="input" />
        <div class="flex-divider">
          <button class="button button--primary button--round" type="submit">
            Create
          </button>
        </div>
      </card-style>
    </form>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
export default {
  data: () => ({
    form: {
      name: "",
      description: "",
      avatar: "",
      cover: "",
      images: "",
      address_line_1: "",
      address_line_2: "",
      post_code: "",
    },
  }),
  computed: {
    ...mapGetters({
      park: "park/getPark",
      user: "user/getAuth",
      auth: "user/isAuth",
    }),
  },
  methods: {
    async parkHandler() {
      if (!this.auth) return alert("You have to be logged in to Create Park");
      this.form.user_id = this.user.id;
      await this.$store.dispatch("park/postPark", this.form);
      return this.$router.push(`/parks/${this.park.id}`);
    },
  },
  components: {
    // ButtonCard: () => import("./Style/Button.vue"),
    CardStyle: () => import("../../components/Style/Card.vue"),
  },
};
</script>

<style lang="scss">
.new-park {
  .flex-divider {
    display: flex;
    justify-content: flex-end;
  }
  &__form {
    // padding: 1rem;
    max-width: 80rem;
    margin: 0 auto;
    // background: white;
  }
}
</style>
