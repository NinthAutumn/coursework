<template>
  <div class="park-body">
    <div class="park-body__content">
      <h2>Parking Slots</h2>
      <ul class="park-body__slots">
        <park-slot
          :park-slot="slot"
          v-for="slot in park.park_slots"
          :key="slot.id"
          @formOpen="handleSlot"
        ></park-slot>
      </ul>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    park: Object,
  },
  methods: {
    handleSlot(slot) {
      this.$emit("formOpen", slot);
    },
  },
  components: {
    ParkSlot: () => import("./ParkSlot"),
  },
};
</script>

<style lang="scss">
.park-body {
  width: 100%;
  display: flex;
  align-items: center;
  flex-direction: column;

  &__content {
    width: 105rem;
    max-width: 100rem;
  }
  &__slots {
    margin: 2rem 0;
    overflow: hidden;
    list-style: none;
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    border-radius: 0.5rem;
    box-shadow: 0 30px 60px -12px rgba(50, 50, 93, 0.25),
      0 18px 36px -18px rgba(0, 0, 0, 0.3);
    .park-slot:nth-child(even) {
      background: rgb(255, 255, 255);
    }
    .park-slot:nth-child(odd) {
      background: #f0f3ff;
    }
  }
}
</style>
