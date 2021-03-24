import Vue from 'vue'
import App from './App.vue'

import { BootstrapVue, IconsPlugin, BootstrapVueIcons } from 'bootstrap-vue'
import { NavbarPlugin } from 'bootstrap-vue'

import { library } from '@fortawesome/fontawesome-svg-core'
import { faUserSecret, faEnvelopeSquare, faPhone } from '@fortawesome/free-solid-svg-icons'
import { faTwitter,faFacebook,faWhatsapp,faLinkedin } from '@fortawesome/free-brands-svg-icons'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'

library.add(faUserSecret)
library.add(faEnvelopeSquare)
library.add(faPhone)
library.add(faTwitter)
library.add(faFacebook)
library.add(faWhatsapp)
library.add(faLinkedin)

Vue.component('font-awesome-icon', FontAwesomeIcon)

import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'

Vue.config.productionTip = false

Vue.use(BootstrapVue)
Vue.use(IconsPlugin)
Vue.use(BootstrapVueIcons)
Vue.use(NavbarPlugin)

new Vue({
  render: h => h(App),
}).$mount('#app')
