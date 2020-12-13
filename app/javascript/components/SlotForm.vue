<template>
  <div class="dialog dialog__container">
    <div class="dialog__content" v-click-outside="close">
      <div class="slot-farm">
        <div class="slot-farm__name">
          {{ `${pslot.width}cm x ${pslot.height}cm` }}
        </div>
        <div class="slot-farm__price">{{ `$${pslot.price}` }}</div>
        <h3>Select The Car You are Going to Use the Park for</h3>
        <div class="slot-farm__cars">
          <img
            src="/assets/plus-solid.svg"
            style="margin-bottom: 1rem; margin-right: 1rem"
            height="25"
            width="25"
            @click.stop="toggleModal"
          />
          <div
            class="slot-farm__car"
            :class="{ 'slot-farm__car--selected': selected_car.id === car.id }"
            v-for="car in cars"
            @click="selected_car = car"
            :key="car.id"
          >
            {{ car.name }}
          </div>
        </div>

        <div class="flex-divider">
          <div
            class="slot-farm__button button button--small button--primary button--pill"
            @click="handleSlot"
          >
            Book a Slot
          </div>
        </div>
      </div>
      <car-form
        :update="update_car"
        :car="current_car"
        @add="addCar"
        @close="toggleModal"
        v-if="car_modal"
      ></car-form>
    </div>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
export default {
  data: () => ({
    pslot: {
      width: 100,
      height: 100,
      price: 14,
    },
    selected_car: {},
    cars: [],
    car_modal: false,
  }),
  props: {
    parkSlot: {
      type: Object,
      default: () => ({
        width: 100,
        height: 100,
        price: 14,
      }),
    },
  },
  computed: {
    ...mapGetters({
      auth: "user/isAuth",
      user: "user/getAuth",
    }),
  },
  async mounted() {
    if (!this.auth) {
      alert("You must be logged in to book a parking slot");
      return this.$emit("close");
    }
    this.cars = await window.$.ajax(`/api/cars/${this.user.id}/list`).promise();
    if (!this.parkSlot.id) {
      this.pslot = await window.$.ajax(
        `/api/slots/${this.$route.params.id}/open`
      ).promise();
    } else {
      this.pslot = this.parkSlot;
    }
  },
  methods: {
    toggleModal() {
      this.car_modal = !this.car_modal;
    },
    close() {
      this.$emit("close");
    },
    addCar(car) {
      this.cars.push(car);
    },
    async handleSlot() {
      if (!this.auth) return alert("You must be logged in to occupy");
      if (!this.selected_car.id) return alert("You must select a car");
      await window.$.ajax({
        method: "POST",
        url: `/api/car_park_slots`,
        data: { park_slot_id: this.pslot.id, car_id: this.selected_car.id },
      }).promise();
      this.$router.go(0);
      // this.$emit("close");
    },
  },
  components: {
    CarForm: () => import("./CarForm"),
  },
  // data: () => ({
  //   parkSlot: {
  //     price: 100,
  //     id: 12,
  //     width: 100,
  //     height: 50,
  //   },
  // }),
};
</script>

<style lang="scss">
@import "../../assets/stylesheets/variable";
.slot-farm {
  width: 25rem;
  .flex-divider {
    display: flex;
    justify-content: flex-end;
  }
  &__name {
    font-size: 1.8rem;
  }
  &__price {
    font-size: 1.6rem;
    text-align: right;
  }
  &__cars {
    display: flex;
    flex-wrap: wrap;
    align-items: center;
  }
  &__car {
    background: $secondary;
    color: white;
    padding: 1rem;
    margin-bottom: 1rem;
    margin-right: 1rem;
    user-select: none;
    cursor: pointer;
    &--selected {
      background: $primary;
    }
  }
  &__button {
    text-align: center;
    cursor: pointer;
    user-select: none;
  }
}
</style>
