<template>
  <v-data-table
    :headers="headers"
    :items="users"
    :items-per-page="5"
    class="elevation-1"
    :search="search"
  ></v-data-table>
</template>

<script>
export default {
  data() {
    return {
      headers: [
        {
          text: "ID",
          align: "start",
          sortable: false,
          value: "id",
        },
        { text: "Name", value: "name" },
        { text: "Email", value: "email" },
        { text: "MAC Address", value: "macAddress" },
        { text: "Date Joined", value: "dateJoined" },
      ],

      users: [
        {
          id: "123",
          name: "Davy Nolan",
          email: "davy@gmail.com",
          macAddress: "123456789",
          dateJoined: "18/02/2021",
        },
        {
          id: "123",
          name: "Davy Nolan",
          email: "davy@gmail.com",
          macAddress: "123456789",
          dateJoined: "18/02/2021",
        },
        {
          id: "123",
          name: "Davy Nolan",
          email: "davy@gmail.com",
          macAddress: "123456789",
          dateJoined: "18/02/2021",
        },
        {
          id: "123",
          name: "Davy Nolan",
          email: "davy@gmail.com",
          macAddress: "123456789",
          dateJoined: "18/02/2021",
        },
      ],
    };
  },
};
</script>
