<script>
export default {
  name: 'HomePage',
  props: {

  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

</style>

<template>
    <div>
        <b-navbar variant="light" type="light" fixed  class="row">
            <b-navbar-nav class="col-1 ">
            </b-navbar-nav>
            <b-navbar-nav small class="col-7 text-left">
                <b-nav align="justify" >
                    <b-nav-item text="Admin@christianportilla.com" class="text-dark">
                        <font-awesome-icon :icon="['fas', 'envelope-square']" />
                        Admin@christianportilla.com
                    </b-nav-item>
                    <b-nav-item text="+51 960677482" class="text-dark">
                        <font-awesome-icon :icon="['fas', 'phone']" />
                        +51 960677482
                    </b-nav-item>
                </b-nav>
            </b-navbar-nav >
            <b-navbar-nav small class="col-3 " fill="true" justified="true" align="right">
                <b-nav align="justify" class="float-right" >
                    <b-nav-item class="text-dark" >
                        <font-awesome-icon :icon="['fab', 'twitter']" />
                    </b-nav-item>
                    <b-nav-item class="text-dark" >
                        <font-awesome-icon :icon="['fab', 'facebook']" />
                    </b-nav-item>
                    <b-nav-item class="text-dark" >
                        <font-awesome-icon :icon="['fab', 'whatsapp']" />
                    </b-nav-item>
                    <b-nav-item class="text-dark" >
                        <font-awesome-icon :icon="['fab', 'linkedin']" />
                    </b-nav-item>
                </b-nav>
            </b-navbar-nav>
            <b-navbar-nav class="col-1 ">
            </b-navbar-nav>
        </b-navbar>
    </div>
</template>
