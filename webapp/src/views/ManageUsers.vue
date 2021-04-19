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
    <h2>User Management Console</h2>
    <br>
    <CreateUserBtn></CreateUserBtn>
    <br>
    <UserTable></UserTable>
  </div>
</div>
</template>

<script>
import UserTable from '../components/UserTable'
import CreateUserBtn from '../components/CreateUserBtn'

export default {
  //name: 'Home',
  components: {
    UserTable,
    CreateUserBtn
  }
}
</script>

<style>
.userlink{
    color: #fff;
    padding: 20px;
  }

  .homelink{
    color: #fff
  }

  .logoutlink{
    color: #fff;
    padding:500px;;
  }
</style>

