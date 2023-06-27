<template>
  <div class="pa-6 right">
    <div class="text-right">
      <slot></slot>
    </div>
    <div>
      <h2>{{ user.header.title }}</h2>
      <div>
        <h4>{{ user.header.first_name }} {{ user.header.last_name }}</h4>
      </div>
      <div v-html="user.header.description"></div>
    </div>

    <div class="my-4">
      <h2>{{ user.educational.title }}</h2>
      <div class="mt-2" v-for="(row, index) in user.educational.details" :key="index">
        <div>
          <h3>{{ row.school }}</h3>
        </div>
        <small v-if="row.date"><b>{{ row.date }}</b></small>
        <div>
          <small>{{ row.faculty }} - {{ row.level }}</small>
        </div>
      </div>
    </div>

    <div>
      <h2>{{ user.experience.title }}</h2>
      <div class="mt-2" v-for="(row, index) in user.experience.details" :key="index">
        <div>
          <h3>{{ row.company }}</h3>
        </div>
        <small><b>{{ row.date }}</b></small>
        <div v-for="(desc, i) in row.description" :key="i">
          <small>{{ `${i + 1}. ${desc.text}` }}</small>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    mode: { type: String, default: "TH" },
    user: { type: Object, default: null }
  },
}
</script>

<style lang="scss" scoped>
.right {
  position: relative;
  .img { max-width: 50px; max-height: 50px; } 
  .lage { position: absolute; right: 1rem; }
}
</style>
