import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import http from "@/http/http"

Vue.config.productionTip = false

//使用element ui
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';

Vue.use(ElementUI);

Vue.config.devtools = true;

// 全局挂载 http（axios）,使用的时候直接使用 this.$http 即可。
Vue.prototype.$http=http

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
