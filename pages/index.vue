<template>
  <div class="page">
    <v-card outlined>
      <v-row no-gutters>
        <v-col v-if="data" cols="12" sm="4" md="4">
          <div class="col-left">
            <profile-left :user="data" />
          </div>
        </v-col>
        <v-col v-if="data" cols="12" sm="8" md="8">
          <div class="col-right">
            <profile-right :mode="lang" :user="data" @lang="setLang">
              <template>
                <v-btn-toggle color="primary" mandatory v-model="toggle">
                  <v-btn small> TH </v-btn>
                  <v-btn small> EN </v-btn>
                </v-btn-toggle>
              </template>
            </profile-right>
          </div>
        </v-col>
      </v-row>
    </v-card>
  </div>
</template>

<script>

export default {
  data() {
    return {
      info: null,
      toggle: 1
    }
  },
  computed: {
    data() {
      if (this.lang == 'TH' && this.info) {
        return this.info.TH
      } else if (this.lang == 'EN' && this.info) {
        return this.info.EN
      }
      return null
    },
    lang(){
      if (this.toggle == 0) return "TH"
      else return "EN"
    }
  },
  methods: {
    async getInfo() {
      let data = await this.$axios.$get('./info.json')
      this.info = data
    },
    setLang(lang){
      this.lang = lang;
    }
  },
  async created() {
    await this.getInfo();
  },
}
</script>

<style lang="scss" scoped>
.page {
  // position: relative;
  min-height:100%;
  .col-left {
    z-index: 100 !important;
    width: 100%;
    min-height: 100%;
    background: url("~/assets/bg-img.jpg") top no-repeat;
    background-size: cover;
    position: relative;
    border-radius: 0 90px 0 0;

    &:before {
      content: "";
      background: rgba(255, 255, 255, 0.856);
      position: absolute;
      bottom: 0;
      top: 0;
      left: 0;
      right: 0;
    }
  }
}

@media only screen and (max-width: 600px) {
  .page {
    .col-left { border-radius: unset !important }
  }
}
</style>