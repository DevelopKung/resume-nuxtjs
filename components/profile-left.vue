<template>
<div class="left">
  <div class="text-center pa-5">
    <v-avatar size="200">
      <v-img class="ma-auto" :src="require('~/assets/profile.jpg')"></v-img>
    </v-avatar>
  </div>
  <div class="">
    <div class="d-flex" @click="toggle =! toggle">
      <v-btn class="mx-2" fab dark x-small depressed color="primary">
        <v-icon class="toggle-icon" :class="{'active': !toggle}">{{ toggle?'fa-minus': 'fa-plus' }}</v-icon>
      </v-btn>
      <h2>{{ user.address.title }}</h2>
    </div>
    <v-expand-transition>
      <div v-show="toggle">
        <div class="ml-4 px-5 mt-2" v-for="(contact, index) in user.address.contact" :key="index">
          <div>
            <v-btn fab dark color="primary" x-small class="mr-2">
              <v-icon small>{{contact.icon}}</v-icon>
            </v-btn>
            {{ contact.value }}
          </div>
        </div>
      </div>
    </v-expand-transition>
    <div>
      <div class="d-flex mt-4 mb-2" @click="toggleSkill =! toggleSkill">
        <v-btn class="mx-2" fab dark x-small depressed color="primary">
          <v-icon class="toggle-icon" :class="{'active': !toggleSkill}">{{ toggleSkill?'fa-minus': 'fa-plus' }}</v-icon>
        </v-btn>
        <h2>{{ user.skill.title }}</h2>
      </div>
      <v-expand-transition>
        <v-row v-show="toggleSkill" align="center" no-gutters>
          <v-col class="ma-2 text-center" cols="auto" sm="auto" v-for="(item, index) in user.skill.data" :key="`item_${index}`">
            <v-card outlined class="pt-2 px-2">
              <img width="30vh" :src="item.img" height="30vh">
            </v-card>
            <small style="font-size: 10px;"><b>{{ item.text }}</b></small>
          </v-col>
          <v-col class="ma-2 text-center" cols="auto" sm="auto" v-for="(item, index) in user.skill.items" :key="index">
            <v-card outlined class="pt-2 px-2">
              <img width="30vh" :src="item.img" height="30vh">
            </v-card>
            <small style="font-size: 10px;"><b>{{ item.text }}</b></small>
          </v-col>
        </v-row>
      </v-expand-transition>
    </div>
  </div>
</div>
</template>

<script>
export default {
  props: {
    mode: {
      type: String,
      default: "TH"
    },
    user: {
      type: Object,
      default: null
    }
  },
  data() {
    return {
      toggle: true,
      toggleSkill: true
    }
  },
}
</script>

<style lang="scss" scoped>
.left { position: relative; z-index: 1000; }
.active{ transform: rotate(-90deg); }
</style>
