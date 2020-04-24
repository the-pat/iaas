<template>
  <div>
    <span class="iaas__header-text">Identicons as a service</span>
    <Identicon :src="src" :size="size" :has-identicon="hasIdenticon" />
    <Form :text.sync="text" :size.sync="size" />
  </div>
</template>
<script>
import Form from "./Form.vue";
import Identicon from "./Identicon.vue";
export default {
  name: "MainLayout",
  components: {
    Form,
    Identicon,
  },
  data: () => ({
    text: "",
    size: 0,
    src: "",
  }),
  created() {
    const size = window[Symbol.for("size")];
    const text = window[Symbol.for("text")];

    this.size = size;
    this.text = text;
  },
  methods: {
    debounce(func, ms) {
      if (this.timeout) clearTimeout(this.timeout);
      this.timeout = setTimeout(func, ms);
    },
    setSrc() {
      const encodedText = encodeURI(this.text);
      this.debounce(
        () => (this.src = `/${encodedText}/${this.size}/identicon.png`),
        300
      );
    },
  },
  watch: {
    size() {
      this.setSrc();
    },
    text() {
      this.setSrc();
    },
  },
  computed: {
    hasIdenticon() {
      const [_, encodedText] = this.src.split("/");
      return !!encodedText.length;
    },
  },
};
</script>

<style lang="scss">
.iaas__header-text {
  font-size: 3.6rem;
  line-height: 1.25;
  font-weight: 300;
  letter-spacing: -0.1rem;
  margin-bottom: 2rem;
  margin-top: 0;
  font-size: 4.6rem;
  line-height: 1.2;
}
</style>
