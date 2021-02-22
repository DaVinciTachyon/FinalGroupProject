<template>
  <v-app>
    <v-app-bar
      app
      color="primary"
      dark
    >
    <h1>Admin Hub</h1>
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
