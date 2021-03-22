<template>
  <v-card class="card">
    <v-card-title>
      User Table
      <v-spacer></v-spacer>
      <v-text-field
        v-model="search"
        append-icon="mdi-magnify"
        label="Search"
        single-line
        hide-details
      ></v-text-field>
    </v-card-title>
    <v-data-table 
    :items="users.monitors" 
    :headers="headers" 
    class="elevation-1"
    :search="search">
      <template v-slot:item.dateJoined="{ item }">
        {{ timeConverter(item.dateJoined) }}
      </template>
      <template v-slot:item.viewMore="{ item }">
        <DeleteUserBtn v-bind:currentUser="item"></DeleteUserBtn>
      </template>
    </v-data-table>
  </v-card>
</template>

<script>
import axios from "axios";
import DeleteUserBtn from "./DeleteUserBtn";

export default {
  components: {
    DeleteUserBtn,
  },
  data() {
    return {
      users: {},
      errors: [],
      hello: "hello",
      search: '',
      headers: [
        {
          text: "Name",
          align: "start",
          sortable: false,
          value: "name",
        },
        {
          text: "Email",
          value: "email",
        },
        {
          text: "MAC Address",
          value: "macAddress",
        },
        {
          text: "Date Joined",
          value: "dateJoined",
        },
        {
          text: "",
          value: "viewMore",
        },
      ],
    };
  },

  methods: {
    timeConverter: function(UNIX_timestamp) {
      var a = new Date(UNIX_timestamp);
      var months = [
        "Jan",
        "Feb",
        "Mar",
        "Apr",
        "May",
        "Jun",
        "Jul",
        "Aug",
        "Sep",
        "Oct",
        "Nov",
        "Dec",
      ];
      var year = a.getFullYear();
      var month = months[a.getMonth()];
      var date = a.getDate();
      var time = date + " " + month + " " + year + " ";
      return time;
    },
  },

  created() {
    axios
      .get("http://localhost:8080/api/monitors/")
      .then((response) => {
        this.users = response.data;
      })
      .catch((e) => {
        this.errors.push(e);
      });
  },
};
</script>
<style>
  .card{
    padding:5px;
  }
</style>