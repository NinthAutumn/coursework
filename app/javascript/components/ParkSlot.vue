<template>
  <div
    class="park-slot"
    :class="{ 'park-slot--occupied': car }"
    @click="$emit('formOpen', parkSlot)"
  >
    {{
      car
        ? "Occupied"
        : `$${parkSlot.price} - ${parkSlot.width}cm x ${parkSlot.height}cm`
    }}
  </div>
</template>

<script>
export default {
  props: {
    parkSlot: Object,
  },
  data: () => ({
    car: null,
  }),
  methods: {},
  async mounted() {
    const res = await window.$.ajax(`/api/slots/${this.parkSlot.id}`).promise();
    this.car = res;
  },
};
</script>

<style lang="scss">
@import "../../assets/stylesheets/variable";

.park-slot {
  &--occupied {
    background: $secondary !important;
    color: white;
  }

  user-select: none;
  cursor: pointer;
  &:hover {
    background: $secondary !important;
    color: white;
  }
  font-size: 1.6rem;
  width: 100%;
  height: 10rem;
  display: flex;
  align-items: center;
  justify-content: center;
}
</style>
