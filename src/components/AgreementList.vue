<template>
    <div class="agreement-list">
        <h2>Your Rental Agreements</h2>
        <ul v-if="agreements.length">
            <li v-for="agreement in agreements" :key="agreement.id">
                <strong>Property:</strong> {{ agreement.propertyDetails }}
                <br>
                <strong>Rent:</strong> {{ agreement.monthlyRent }} Ether
                <br>
                <strong>Duration:</strong> {{ agreement.duration }} months
                <br>
                <strong>Status:</strong> {{ agreement.state }}
            </li>
        </ul>
        <p v-else>You have no rental agreements.</p>
    </div>
</template>

<script>
export default {
    data() {
        return {
            agreements: []  // Array to store the list of rental agreements
        }
    },
    created() {
        this.fetchAgreements();
    },
    methods: {
        async fetchAgreements() {
            // Logic to interact with the Ethereum blockchain and retrieve the rental agreements
            // This would involve using a library like Web3.js or Ethers.js
            // Populate the 'agreements' array with the fetched data
        }
    }
}
</script>

<style scoped>
/* Basic styling for the agreement list */
.agreement-list {
    max-width: 600px;
    margin: 0 auto;
    padding: 20px;
}

li {
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    margin-bottom: 10px;
}
</style>
