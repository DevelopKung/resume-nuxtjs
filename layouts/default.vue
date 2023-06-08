<template>
  <v-app>
    <v-container class="container">
      <nuxt />
    </v-container>
  </v-app>
</template>

<script>
export default {
  data () {
    return {   
    }
  } ,
}
</script>
<style lang="scss">
  v-app , .v-application { 
    min-height:100%;

    .container {
      max-width: 840px !important;
    }
  }
</style>