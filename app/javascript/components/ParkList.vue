<template>
  <div class="park-list">
    <div class="park-list__container">
      <!-- list of parks -->
      <router-link
        tag="div"
        class="park-list__item"
        v-for="park of parks"
        :key="park.id"
        :to="`/parks/${park.id}`"
      >
        <h4>{{ park.name }}</h4>
        <img :src="park.cover" alt="" class="park-list__cover" />
      </router-link>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    parks: Array,
  },
};
</script>

<style lang="scss">
.park-list {
  &__container {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(5rem, 32rem));
    gap: 10px;
    max-width: 100%;
  }
  &__item {
    width: 100%;
    height: 100%;
    display: flex;
    align-items: center;
    flex-direction: column;
    position: relative;
    height: 25rem;
    cursor: pointer;
  }
  h4 {
    z-index: 1;
    font-size: 1.5rem;
    color: white;
    background: rgba(0, 0, 0, 0.616);
    padding: 0.5rem 1rem;
    border-radius: 10rem;
    border: 1px solid black;
  }
  &__cover {
    width: 100%;
    height: 100%;
    position: absolute;
    top: 0;
    left: 0;
  }
}
</style>
