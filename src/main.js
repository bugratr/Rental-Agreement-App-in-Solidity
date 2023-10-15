import Vue from 'vue';
import App from './App.vue';

// If using additional plugins or libraries, like Vue Router or Vuex, they would be imported here.

// Vue configuration
Vue.config.productionTip = false;

new Vue({
  render: h => h(App)
}).$mount('#app');
