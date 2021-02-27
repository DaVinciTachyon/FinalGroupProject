<template>
  <div class="home">
    <br>
    <h2>User Management Console</h2>
    <br>
    <UserTable></UserTable>
  </div>
</template>

<script>
import UserTable from '../components/UserTable'

export default {
  name: 'Home',
  components: {
    UserTable
  }
}
</script>
