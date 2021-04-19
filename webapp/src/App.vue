<template>
  <v-app>
   

    <v-content>
      <router-view></router-view>
    </v-content>

  </v-app>
</template>

<script>


export default {
  name: 'App',


  data: () => ({
    //
  }),
};
</script>

<style>
  .userlink{
    color: #fff;
    padding: 20px;
  }

  .homelink{
    color: #fff
  }
</style>