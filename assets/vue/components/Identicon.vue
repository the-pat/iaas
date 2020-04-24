<template>
  <div class="iaas__identicon">
    <img
      :src="src"
      :alt="alt"
      :title="text"
      class="card mw-300"
      v-if="hasIdenticon"
    />
    <figcaption id="caption">
      A {{ size }}x{{ size }} identicon from
      <strong>{{ text }}</strong>
    </figcaption>
  </div>
</template>
<script>
export default {
  name: "Identicon",
  props: {
    size: Number,
    src: String,
    hasIdenticon: Boolean,
  },
  computed: {
    alt() {
      return `A ${this.size}x${this.size} identicon from '${this.text}'`;
    },
    text() {
      const [_, encodedText] = this.src.split("/");
      return decodeURI(encodedText);
    },
  },
};
</script>

<style lang="scss">
.iaas__identicon {
  display: flex;
  flex-flow: column;
  align-items: center;

  img {
    object-fit: contain;
  }
  figcaption {
    font-size: smaller;
    margin-bottom: 3rem;
  }

  .mw-300 {
    max-width: 300px;
  }

  .card {
    border-radius: 4px;
    box-shadow: 0px 2px 1px -1px rgba(0, 0, 0, 0.2),
      0px 1px 1px 0px rgba(0, 0, 0, 0.14), 0px 1px 3px 0px rgba(0, 0, 0, 0.12);
  }
}
</style>
