<template>
  <button class="random-btn" @click="get">Random</button>
</template>
<script>
import DebounceMixin from "../mixins/DebounceMixin";
export default {
  name: "RandomBtn",
  mixins: [DebounceMixin],
  methods: {
    get() {
      const randomWordEndpoint = "/random";
      this.debounce(async () => {
        const response = await fetch(randomWordEndpoint);
        this.$emit("random", await response.text());
      }, 300);
    },
  },
};
</script>

<style lang="scss">
.random-btn {
  & {
    margin-left: 10px;
    border: none;
  }
  &:not(:hover) {
    background-color: #4caf50; /* Green */
  }
}
</style>
