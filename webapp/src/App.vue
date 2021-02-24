<template>
  <v-app>
    <v-app-bar
      app
      color="primary"
      dark
    >
    <router-link to="/"><h1 class="homelink">Admin Hub</h1></router-link>
    
    <router-link to="/users"> <h3 class="userlink">Users</h3> </router-link>
    </v-app-bar>

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