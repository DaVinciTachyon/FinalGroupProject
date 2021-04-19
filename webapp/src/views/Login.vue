<template>
  <div>
    
    <v-app-bar
      app
      color="primary"
      dark
    >
    <router-link to="/"><h1 class="loginlink">Admin Hub</h1></router-link>
    
    </v-app-bar>

    <v-content>
      <router-view></router-view>
    </v-content>

  
  <v-card class=login>
        <v-card-title>
          <span class="headline">Login</span>
        </v-card-title>
      
        <v-form ref="form" v-model="valid" lazy-validation class="form">
          <v-text-field
            v-model="email"
            label="E-mail"
            required
          ></v-text-field>

          <v-text-field
            v-model="password"
            type="password"
            label="Password"
            required
          ></v-text-field>
        </v-form>
        <v-card-actions>
          <v-spacer></v-spacer>
          
          
          <v-btn color="green darken-1" text @click="dialog = false; adminLogin(email, password);">
            <router-link to="/home">Login</router-link>
          </v-btn>
        </v-card-actions>
      </v-card>
  </div>
</template>

<script>

import axios from "axios";
export default {
  //name: 'Home',
  components: {

  },
  methods: {
    adminLogin: function(email,password){
      axios
        .post("http://localhost:8080/api/administrator/login/", {
          email: email,
          password: password
        })
        .then(() => {
          console.log("Admin with email "+email+" has been successfully logged in.");
        })
        .catch((e) => {
          console.log(e);
        });
    },
  }
}
</script>

<style>
.loginlink{
  color: #fff
}

</style>