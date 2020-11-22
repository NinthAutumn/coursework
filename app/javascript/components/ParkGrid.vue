<template>
  <div class="park-grid">
    <div
      class="park-grid__container"
      :style="{
        gridTemplateRows: `repeat(${row},1fr)`,
      }"
    >
      <div
        class="park-grid__row"
        :style="{ gridTemplateColumns: `repeat(${col},1fr)` }"
        v-for="(row, i) in grid"
        :key="i"
      >
        <div
          class="park-grid__col"
          v-for="(col, j) in row"
          :key="j"
          :class="{
            'park-grid__col--occupied': col && col.occupied,
            'park-grid__col--slot': col && !col.occupied,
          }"
        >
          <div class="park-grid__slot" v-if="col">
            {{ i + 1 }}x{{ j + 1 }}
            <br />
            {{ col.occupied ? "Occupied" : "Free" }}
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data: () => ({
    parks: [
      {
        id: 1123,
        occupied: false,
        occupied_car: {},
        park_column_number: 0,
        park_row_number: 0,
      },
      {
        id: 11,
        occupied: true,
        occupied_car: {},
        park_column_number: 5,
        park_row_number: 2,
      },
      {
        id: 131,
        occupied: false,
        occupied_car: {},
        park_column_number: 9,
        park_row_number: 4,
      },
      {
        id: 131,
        occupied: false,
        occupied_car: {},
        park_column_number: 4,
        park_row_number: 9,
      },
      {
        id: 131,
        occupied: false,
        occupied_car: {},
        park_column_number: 5,
        park_row_number: 3,
      },
      {
        id: 131,
        occupied: false,
        occupied_car: {},
        park_column_number: 3,
        park_row_number: 3,
      },
      {
        id: 131,
        occupied: false,
        occupied_car: {},
        park_column_number: 4,
        park_row_number: 9,
      },
    ],
    grid: [],
    col: 10,
    row: 10,
  }),
  mounted() {
    for (let i = 0; i < this.row; i++) {
      this.grid.push([]);
      for (let j = 0; j < this.col; j++) {
        let park = this.parks.find(
          (item) => item.park_column_number === j && item.park_row_number === i
        );
        this.grid[this.grid.length - 1][j] = park ? park : false;
      }
    }
  },
};
</script>

<style lang="scss">
@media screen and (max-width: 700px) {
}
@import "../../assets/stylesheets/variable";
.park-grid {
  &__container {
    display: grid;
    height: 70rem;
    max-height: 70rem;
    box-shadow: 0 30px 60px -12px rgba(50, 50, 93, 0.25),
      0 18px 36px -18px rgba(0, 0, 0, 0.3);
    border-radius: 1rem;
    background: white;
    margin-bottom: 1rem;
  }
  &__row {
    width: 100%;
    height: 100%;
    display: grid;
  }
  &__slot {
    user-select: none;
    // width: 100%;
    text-align: center;
    // height: 100%;
  }
  &__col {
    width: 100%;
    height: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    &--slot {
      background: $primary;
      cursor: pointer;
      color: white;
      box-shadow: rgba(0, 0, 0, 0) 0px 0px 0px 0px,
        rgba(0, 0, 0, 0) 0px 0px 0px 0px, rgba(0, 0, 0, 0.12) 0px 1px 1px 0px,
        rgba(60, 66, 87, 0.16) 0px 0px 0px 1px, rgba(0, 0, 0, 0) 0px 0px 0px 0px,
        rgba(0, 0, 0, 0) 0px 0px 0px 0px, rgba(60, 66, 87, 0.08) 0px 2px 5px 0px;
    }
    &--slot:hover {
      background: $secondary;
    }
    &--occupied {
      color: white;
      background: $secondary;
    }
  }
}
</style>
