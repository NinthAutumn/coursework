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
        <img :src="park.avatar" height="100" width="100" alt="" />
        <p>{{ park.name }}</p>
        <router-link
          tag="button"
          :to="`/parks/${park.id}/update`"
          class="button button--secondary button--pill"
          >Edit</router-link
        >
        <button
          @click="handleModal(park.id)"
          class="button button--error button--pill"
        >
          Delete
        </button>
      </div>
    </div>
    <delete-modal
      @close="closeModal"
      v-if="modal"
      :id="selected_id"
    ></delete-modal>
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
  data: () => ({
    modal: false,
    selected_id: 0,
  }),
  methods: {
    closeModal() {
      this.selected_id = 0;
      this.modal = !this.modal;
    },
    handleModal(id) {
      this.selected_id = id;
      this.modal = !this.modal;
    },
  },
  async mounted() {
    if (this.auth)
      await this.$store.dispatch("park/fetchUserParks", {
        user_id: this.user.id,
      });
  },
  components: {
    DeleteModal: () => import("./DeleteModal"),
  },
};
</script>

<style lang="scss">
@import "../../assets/stylesheets/variable";
.user-parks {
  &__list {
    display: flex;
    flex-wrap: wrap;
  }
  &__item {
    .button {
      align-self: center;
    }
    padding: 1rem;
    background: white;
    border-radius: 0.5rem;
    margin-right: 1rem;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    img {
      cursor: pointer;
      color: $primary;
    }
  }
}
</style>
