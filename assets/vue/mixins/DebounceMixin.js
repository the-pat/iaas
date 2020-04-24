export default {
  methods: {
    debounce(func, ms) {
      if (this.timeout) clearTimeout(this.timeout);
      this.timeout = setTimeout(func, ms);
    },
  },
};
