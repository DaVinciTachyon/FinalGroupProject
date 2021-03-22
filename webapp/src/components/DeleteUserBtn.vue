<template>
  <v-row justify="center">
    <v-dialog v-model="dialog" width="600px">
      <template v-slot:activator="{ on, attrs }">
        <v-btn color="red" dark v-bind="attrs" v-on="on">
          Delete User
        </v-btn>
      </template>
      <v-card>
        <v-card-title>
          <span class="headline">Delete User</span>
        </v-card-title>
        <v-card>
          delete user menu
        </v-card>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn color="green darken-1" text @click="dialog = false">
            Close
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </v-row>
</template>

<script>
//import ViewMorePage from './ViewMorePage'
export default {
  data() {
    return {
      dialog: false,
    };
  },
  props: [
    'currentUser',
  ],
  components: {
    //ViewMorePage
  },

};
</script>