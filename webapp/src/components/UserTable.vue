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
      :search="search"
    >
      <template v-slot:item.dateJoined="{ item }">
        {{ timeConverter(item.dateJoined) }}
      </template>
    
      <template v-slot:item.action="{ item }">
        <DeleteUserBtn v-bind:currentUser="item" v-if="item.active"></DeleteUserBtn>
        <ActivateUserBtn v-bind:currentUser="item" v-else></ActivateUserBtn>
      </template>
    
      <template v-slot:item.active="{ item }">
        <v-chip
          v-if="item.active == false"
          color="grey"
          small
          text-color="white"
        >
          Inactive
        </v-chip>
        <v-chip
          v-if="item.active == true"
          color="green"
          small
          text-color="white"
        >
          Active
        </v-chip>
      </template>
    </v-data-table>
  </v-card>
</template>

<script>
import axios from "axios";
import DeleteUserBtn from "./DeleteUserBtn";
import ActivateUserBtn from "./ActivateUserBtn"
export default {
  components: {
    DeleteUserBtn,
    ActivateUserBtn
  },
  data() {
    return {
      users: {},
      errors: [],
      hello: "hello",
      search: "",
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
          text: "ID",
          value: "id",
        },
        {
          text: "Date Joined",
          value: "dateJoined",
        },
        {
          text: "Status",
          value: "active",
        },
        {
          text: "",
          value: "action",
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
.card {
  padding: 5px;
}
</style>
