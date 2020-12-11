<template>
  <div class="user-show">
    <div class="user-show__container">
      <card-style style="width: 80rem">
        <div class="user-show__header">
          <div class="user-show__avatar">
            <img
              src="/assets/avatar.png"
              class="avatar avatar--big"
              alt="user avatar"
            />
          </div>
          <h3 class="user-show__usename">
            {{ user.username }}
          </h3>
        </div>
        <div class="user-show__parks">
          <user-parks :id="parseInt($route.params.id)"></user-parks>
        </div>
        <h3>Car List</h3>
        <div class="user-show__cars">
          <div
            @click="toggleUpdateModal(car)"
            class="user-show__car"
            v-for="car of cars"
            :key="car.id"
          >
            <p>{{ car.name }} - {{ car.number_plate }} x {{ car.brand }}</p>
          </div>
          <div class="flex-divider">
            <img
              src="/assets/plus-solid.svg"
              style="cursor: pointer"
              width="100"
              height="100"
              alt=""
              @click.stop="toggleModal"
            />
          </div>
        </div>
      </card-style>
    </div>
    <car-form
      :update="update_car"
      :car="current_car"
      @add="addCar"
      @close="toggleModal"
      v-if="car_modal"
    ></car-form>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
export default {
  data: () => ({
    cars: [],
    car_modal: false,
    current_car: {},
    update_car: false,
  }),
  computed: {
    ...mapGetters({
      user: "user/getUser",
      parks: "park/getUserParks",
    }),
  },
  methods: {
    toggleUpdateModal(car) {
      this.current_car = car;
      this.update_car = true;
      this.car_modal = !this.car_modal;
    },
    toggleModal() {
      this.update_car = false;
      this.current_car = {};
      this.car_modal = !this.car_modal;
    },
    addCar(car) {
      this.cars.push(car);
    },
  },
  async mounted() {
    this.cars = await window.$.ajax(
      `/api/cars/${this.$route.params.id}/list`
    ).promise();
    await this.$store.dispatch("user/fetchUser", this.$route.params.id);
    await this.$store.dispatch("park/fetchUserParks", {
      user_id: this.$route.params.id,
    });
  },
  components: {
    UserParks: () => import("../../components/UserParks"),
    CardStyle: () => import("../../components/Style/Card"),
    CarForm: () => import("../../components/CarForm"),
  },
};
</script>

<style lang="scss">
@import "../../../assets/stylesheets/variable";
.user-show {
  &__header {
    width: 100%;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
  }
  width: 100%;
  &__car {
    cursor: pointer;
    padding: 1rem;
    background: $primary;
    color: white;
    // border-radius: 0.5rem;
    margin-bottom: 1rem;
  }
  .flex-divider {
    display: flex;
    justify-content: center;
  }
  &__container {
    display: flex;
    justify-content: center;
  }
}
</style>
