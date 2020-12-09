<template>
  <div class="edit-park">
    <form @submit.prevent="parkHandler" class="edit-park__form">
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
        <div class="edit-park__slot">
          <label>Add Park Slots</label>

          <div class="edit-park__list">
            <img src="/assets/plus-solid.svg" width="20" height="20" alt="" />
            <div
              class="edit-park__item"
              v-for="slot in form.park_slots"
              :key="slot.id"
            >
              ${{ slot.price }} -{{ slot.width }} x {{ slot.height }}
            </div>
          </div>
        </div>
        <div class="flex-divider">
          <button class="button button--primary button--round" type="submit">
            Update
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
    }),
  },
  methods: {
    async parkHandler() {
      await this.$store.dispatch("park/patchPark", this.form);
      // return this.$router.push(`/parks/${this.park.id}`);
    },
  },
  async mounted() {
    this.form = {
      ...(await window.$.ajax(
        `/api/parks/${this.$route.params.id}?simple=true`
      ).promise()),
    };
  },
  components: {
    // ButtonCard: () => import("./Style/Button.vue"),
    CardStyle: () => import("../../../components/Style/Card.vue"),
  },
};
</script>

<style lang="scss">
.edit-park {
  .flex-divider {
    display: flex;
    justify-content: flex-end;
  }
  &__list {
    display: flex;
    align-items: center;
    flex-wrap: wrap;
  }
  &__item {
    margin-left: 1rem;
    padding: 1rem;
    background: #f0f3ff;
    margin-bottom: 1rem;
    // margin-top: 1rem;
  }
  &__form {
    // padding: 1rem;
    max-width: 80rem;
    margin: 0 auto;
    // background: white;
  }
}
</style>
