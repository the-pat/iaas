import { components } from "./components";
import { store } from "./store";
const { MainLayout } = components;
new Vue({
  el: `#app`,
  components,
  store,
  render: (r) => r(MainLayout),
});
