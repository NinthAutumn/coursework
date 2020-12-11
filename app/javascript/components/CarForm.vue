<template>
  <div class="car-form dialog dialog__container">
    <div class="dialog__content" v-click-outside="close">
      <form @submit.prevent="formHandler">
        <h3>{{ update ? "Update" : "Create" }} Car</h3>
        <label for="name">Name</label>
        <input name="name" v-model="form.name" type="text" class="input" />
        <label for="number_plate">Number Plate</label>
        <input
          name="number_plate"
          v-model="form.number_plate"
          type="text"
          class="input"
        />
        <label for="brand">Brand</label>
        <input name="brand" v-model="form.brand" type="text" class="input" />
        <button class="button button--pill button--primary">
          {{ update ? "Update" : "Create" }}
        </button>
      </form>
    </div>
  </div>
</template>

<script>
import Cookie from "js-cookie";
import { mapGetters } from "vuex";
export default {
  props: {
    update: {
      type: Boolean,
    },
    car: {
      type: Object,
      default: () => ({}),
    },
  },
  watch: {
    update() {
      if (this.update) {
        this.form = this.car;
      } else {
        this.form = {
          name: "",
          number_plate: "",
          brand: "",
          user_id: this.user.id,
        };
      }
    },
  },
  data: () => ({
    form: {
      name: "",
      number_plate: "",
      brand: "",
      user_id: 0,
    },
  }),
  computed: {
    ...mapGetters({
      user: "user/getAuth",
    }),
  },
  mounted() {
    if (this.update) {
      this.form = this.car;
    } else {
      this.form.user_id = this.user.id;
    }
  },
  methods: {
    close() {
      this.$emit("close");
    },
    async formHandler() {
      try {
        if (this.update) {
          await window.$.ajax({
            method: "PATCH",
            url: `/api/cars/${this.form.id}`,
            data: this.form,
            headers: {
              Authorization: Cookie.get("Authorization"),
            },
          }).promise();
        } else {
          const car = await window.$.ajax({
            method: "POST",
            url: "/api/cars",
            data: this.form,
            headers: {
              Authorization: Cookie.get("Authorization"),
            },
          }).promise();
          this.form = {
            name: "",
            number_plate: "",
            brand: "",
            user_id: this.user.id,
          };
          this.$emit("add", car);
        }
      } catch (error) {}
    },
  },
};
</script>

<style lang="scss">
</style>
