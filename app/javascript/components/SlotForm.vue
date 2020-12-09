<template>
  <div class="dialog dialog__container">
    <div class="dialog__content" v-click-outside="close">
      <div class="slot-farm">
        <div class="slot-farm__name">
          {{ `${pslot.width}cm x ${pslot.height}cm` }}
        </div>
        <div class="slot-farm__price">{{ `$${pslot.price}` }}</div>
        <div class="flex-divider">
          <div
            class="slot-farm__button button button--small button--primary button--pill"
            @click="handleSlot"
          >
            Book a Slot
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data: () => ({
    pslot: {
      width: 100,
      height: 100,
      price: 14,
    },
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
  async mounted() {
    if (!this.parkSlot.id) {
      this.pslot = await window.$.ajax(
        `/api/slots/${this.$route.params.id}/open`
      ).promise();
    } else {
      this.pslot = this.parkSlot;
    }
  },
  methods: {
    close() {
      this.$emit("close");
    },
    async handleSlot() {
      await window.$.ajax(`/api/slots/`);
    },
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
  &__button {
    text-align: center;
    cursor: pointer;
    user-select: none;
  }
}
</style>
