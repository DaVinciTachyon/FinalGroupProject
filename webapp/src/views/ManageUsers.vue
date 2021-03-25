<template>
  <div class="home">
    <br>
    <h2>User Management Console</h2>
    <br>
    <CreateUserBtn></CreateUserBtn>
    <br>
    <UserTable></UserTable>
  </div>
</template>

<script>
import UserTable from '../components/UserTable'
import CreateUserBtn from '../components/CreateUserBtn'

export default {
  name: 'Home',
  components: {
    UserTable,
    CreateUserBtn
  }
}
</script>

