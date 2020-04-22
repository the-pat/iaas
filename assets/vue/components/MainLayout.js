export const MainLayout = Vue.component("MainLayout", {
  template: `
    <div>
      <h1>Identicons as a service</h1>
      <Identicon
        :src="src"
        :text="text"
        :size="size"
        />
      <Form
        :text.sync="text"
        :size.sync="size"
        />
    </div>
  `,
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
});
