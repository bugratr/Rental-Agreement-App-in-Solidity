<template>
    <div id="app">
        <header>
            <h1>Rental Agreement dApp</h1>
        </header>

        <nav>
            <button @click="showComponent = 'agreementForm'">Create Agreement</button>
            <button @click="showComponent = 'agreementList'">My Agreements</button>
            <button @click="showComponent = 'paymentGateway'">Payments</button>
        </nav>

        <main>
            <AgreementForm v-if="showComponent === 'agreementForm'" />
            <AgreementList v-if="showComponent === 'agreementList'" />
            <PaymentGateway v-if="showComponent === 'paymentGateway'" />
        </main>
    </div>
</template>

<script>
import AgreementForm from './components/AgreementForm.vue';
import AgreementList from './components/AgreementList.vue';
import PaymentGateway from './components/PaymentGateway.vue';

export default {
    components: {
        AgreementForm,
        AgreementList,
        PaymentGateway
    },
    data() {
        return {
            showComponent: 'agreementForm'  // Default component to show
        }
    }
}
</script>

<style scoped>
/* Styling for the app's layout */
header, nav, main {
    max-width: 800px;
    margin: 20px auto;
    text-align: center;
}

nav button {
    margin: 5px;
    padding: 10px 20px;
}
</style>
