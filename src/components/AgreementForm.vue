<template>
    <div class="agreement-form">
        <h2>Create Rental Agreement</h2>
        <form @submit.prevent="createAgreement">
            <div>
                <label for="propertyDetails">Property Details:</label>
                <textarea v-model="propertyDetails" id="propertyDetails" required></textarea>
            </div>
            <div>
                <label for="monthlyRent">Monthly Rent (in Ether):</label>
                <input type="number" v-model="monthlyRent" id="monthlyRent" required>
            </div>
            <div>
                <label for="depositAmount">Deposit Amount (in Ether):</label>
                <input type="number" v-model="depositAmount" id="depositAmount" required>
            </div>
            <div>
                <label for="duration">Duration (in months):</label>
                <input type="number" v-model="duration" id="duration" required>
            </div>
            <button type="submit">Create Agreement</button>
        </form>
    </div>
</template>

<script>
export default {
    data() {
        return {
            propertyDetails: '',
            monthlyRent: 0,
            depositAmount: 0,
            duration: 0
        }
    },
    methods: {
        async createAgreement() {
            // Logic to interact with the Ethereum blockchain and create a new rental agreement
            // This would involve using a library like Web3.js or Ethers.js
        }
    }
}
</script>

<style scoped>
/* Basic styling for the form */
.agreement-form {
    max-width: 400px;
    margin: 0 auto;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

label, input, textarea, button {
    display: block;
    width: 100%;
    margin-bottom: 10px;
}
</style>
