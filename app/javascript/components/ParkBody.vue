<template>
  <div class="park-body">
    <div class="park-body__content">
      <h2>Parking Slots</h2>
      <ul class="park-body__slots">
        <park-slot
          :park-slot="slot"
          v-for="slot in park.park_slots"
          :key="slot.id"
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
  ul {
    list-style-type: none;
  }
  &__content {
    width: 105rem;
    max-width: 100rem;
  }
  &__slots {
    list-style: none;
    display: grid;
    grid-template-columns: repeat(3, 1fr);
  }
}
</style>
