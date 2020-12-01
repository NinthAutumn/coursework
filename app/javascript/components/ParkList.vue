<template>
  <div class="park-list">
    <div class="park-list__container">
      <router-link
        tag="div"
        class="park-list__item"
        v-for="park of parks"
        :key="park.id"
        :to="`/parks/${park.id}`"
      >
        <h4>{{ park.name }}</h4>
        <!-- <p>{{ park.description }}</p> -->
        <img :src="park.avatar" alt="" class="park-list__cover" />
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
    grid-template-columns: repeat(5, 1fr);
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
