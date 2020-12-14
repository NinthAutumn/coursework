<template>
  <div class="park-show">
    <park-header @formOpen="handleSlot" :park="park"></park-header>
    <park-body @formOpen="handleSlot" :park="park"></park-body>
    <slot-form
      @close="handleSlot"
      :park-slot="parkSlot"
      v-if="form"
    ></slot-form>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
import ParkBody from "../../../components/ParkBody";

export default {
  computed: {
    ...mapGetters({
      park: "park/getPark",
    }),
  },
  data: () => ({
    parkSlot: {},
    form: false,
  }),
  components: {
    ParkHeader: () => import("../../../components/ParkHeader"),
    ParkBody,
    SlotForm: () => import("../../../components/SlotForm"),
  },
  methods: {
    handleSlot(slot) {
      this.form = !this.form;
      this.parkSlot = slot;
    },
  },
  async mounted() {
    await this.$store.dispatch("park/fetchPark", this.$route.params.id);
    // console.log(res);
  },
};
</script>

<style lang="scss">
.park-show {
  // margin: 0 -1rem;
  box-sizing: border-box;
}
</style>
