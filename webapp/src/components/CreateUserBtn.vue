<template>
  <v-row justify="center">
    <v-dialog v-model="dialog" width="600px">
      <template v-slot:activator="{ on, attrs }">
        <v-btn color="green" dark v-bind="attrs" v-on="on">
          Create User
        </v-btn>
      </template>
      <v-card>
        <v-card-title>
          <span class="headline">Create a User</span>
        </v-card-title>
      
        <v-form ref="form" v-model="valid" lazy-validation class="form">
          <v-text-field
            v-model="firstName"
            label="First Name"
            required
          ></v-text-field>

          <v-text-field
            v-model="lastName"
            label="Last Name"
            required
          ></v-text-field>

          <v-text-field
            v-model="email"
            label="E-mail"
            required
          ></v-text-field>

          <v-text-field
            v-model="macAddress"
            label="MAC Address"
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
          <v-btn color="red" text @click="dialog = false">
            Cancel
          </v-btn>
          <v-btn color="green darken-1" text @click="dialog = false; createUser(email, firstName, lastName, macAddress, password);">
            Create
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </v-row>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      dialog: false,
    };
  },
  components: {},
  methods: {
    createUser: function(email, firstName, lastName, macAddress, password) {
      var fullName = firstName + " " + lastName;
      axios
        .post("http://localhost:8080/api/monitor/register/", {
          email: email,
          name: fullName,
          macAddress: macAddress,
          password: password
        })
        .then(() => {
          console.log(
            "User with email " + email + " has been successfully created."
          );
        })
        .catch((e) => {
          console.log(e);
        });
    },
  },
};
</script>

<style>

.form{
  padding:15px;
}
</style>
