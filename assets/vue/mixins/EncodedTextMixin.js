export default {
  computed: {
    encodedText() {
      const [_, encodedText] = this.src.split("/");
      return encodedText;
    },
  },
};
