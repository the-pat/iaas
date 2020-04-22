export const Identicon = Vue.component("Identicon", {
  template: `
    <div class="center">
      <img 
        id="identicon" 
        :src="src" 
        :alt="alt" 
        :title="text" 
        class="card mw-300" />
      <figcaption id="caption">
      A {{size}}x{{size}} identicon from <strong>{{text}}</strong>
      </figcaption>
    </div>
  `,
  props: {
    size: Number,
    text: String,
    src: String,
  },
  computed: {
    alt() {
      return `A ${this.size}x${this.size} identicon from '${this.text}'`;
    },
  },
});
