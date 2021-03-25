<template>
  <v-row justify="center">
    <v-dialog v-model="dialog" width="600px">
      <template v-slot:activator="{ on, attrs }">
        <v-btn color="primary" dark v-bind="attrs" v-on="on">
          Activate
        </v-btn>
      </template>
      <v-card>
        <v-card-title>
          <span class="headline">Activate {{currentUser.email}}?</span>
        </v-card-title>
    
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn color="red" text @click="dialog = false">
            No
          </v-btn>
          <v-btn color="green darken-1" text @click="dialog = false; activateUser(currentUser.email);">
            Yes
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </v-row>
</template>

<script>
//import axios from "axios";
export default {
  data() {
    return {
      dialog: false,
    };
  },
  props: ["currentUser"],
  components: {
  },
  methods: {
    activateUser: function() {
        /*
      axios
        .post("http://localhost:8080/api/monitor/delete/", {
          email: email
        })
        .then(() => {
          console.log("User with email "+email+" has been successfully deleted.");
        })
        .catch((e) => {
          console.log(e);
        });
        */
    },
  },
};
</script>