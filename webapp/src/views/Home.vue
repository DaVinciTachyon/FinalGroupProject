<template>
<div>
  <v-app-bar
      app
      color="primary"
      dark
    >
    <router-link to="/home"><h3 class="homelink">Forms</h3></router-link>
    
    <router-link to="/users"> <h3 class="userlink">Users</h3> </router-link>

    <router-link to="/"> <h4 class="logoutlink">Logout</h4> </router-link>
    </v-app-bar>

    <v-content>
      <router-view></router-view>
    </v-content>
  <div class="home">
    <br>
    <h2>Home Page</h2>
    <br>
    <FormTable></FormTable>
  </div>
</div>
</template>

<script>
import FormTable from '../components/FormTable'

export default {
  //name: 'Home',
  components: {
    FormTable
  }

}
</script>
<style>
.home{
  padding: 15px;
}

 .userlink{
    color: #fff;
    padding: 20px;
  }

  .homelink{
    color: #fff;
  }

  .logoutlink{
    color: #fff;
    padding:500px;;
  }
</style>