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
    //     park: {
    //       id: 1,
    //       name: "sadfasdfasf",
    //       description: `Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum eu vehicula erat, id placerat felis. Donec risus metus, fringilla id commodo eget, mattis ut est. Sed feugiat diam eget odio ultricies bibendum. Sed sed euismod sapien, non ultrices erat. Phasellus in mollis diam. Nulla ut viverra felis. Nunc sit amet ante varius, luctus risus sit amet, venenatis metus. Nam auctor felis et tellus rhoncus ultricies. Vivamus non varius nulla. Nullam id augue ut risus tincidunt finibus. In hendrerit nulla sit amet eleifend gravida. Aenean enim augue, rutrum quis turpis sit amet, sodales tincidunt nisl. Etiam ut tincidunt purus, nec feugiat sem.

    // Fusce quis maximus sem, tempor commodo mauris. Etiam eget odio diam. Nulla luctus mollis placerat. Nunc ut tortor a lacus bibendum finibus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aliquam felis ipsum, sagittis vitae leo eget, tincidunt vestibulum neque. Cras condimentum augue nec orci dignissim viverra. Vestibulum et congue turpis. Etiam imperdiet lectus ligula, id molestie leo rhoncus eget. Nullam tincidunt neque justo, sed sollicitudin ipsum scelerisque quis. Nam id nunc odio. Fusce bibendum efficitur mollis. Sed felis lacus, tempus vel tellus ac, blandit laoreet ipsum. Mauris euismod fermentum ex sit amet vestibulum.`,
    //       address_line_1: "6 Johnston Green",
    //       address_line_2: "",
    //       post_code: "GU2 9XS",
    //       avatar:
    //         "https://sika.scene7.com/is/image/sika/glo-car-parking-garage-floor-03?wid=1280&crop=0%2C114%2C3840%2C2443",
    //       cover:
    //         "https://ks-kentico-prod-cdn-endpoint.azureedge.net/netxstoreviews/webHeroSuperLarge/116097.jpg",
    //       available_slot_count: 5,
    //       total_slot_count: 15,
    //     },
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
  margin: 0 -1rem;
  box-sizing: border-box;
}
</style>
