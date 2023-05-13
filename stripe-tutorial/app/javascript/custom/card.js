// Get the input field element by its ID
const cardNumberInput = document.getElementById('cardNumber');

// Add an event listener for input change
cardNumberInput.addEventListener('input', (event) => {
    // Remove all non-digit characters from the input value
    const cardNumber = event.target.value.replace(/\D/g, '');

    // Add a space after every 4 digits
    const formattedCardNumber = cardNumber.replace(/(\d{4})/g, '$1 ');

    // Update the input value with the formatted card number
    event.target.value = formattedCardNumber.trim();

    // Limit the input to a maximum of 16 digits
    if (cardNumber.length > 16) {
        event.target.value = formattedCardNumber.slice(0, 19).trim();
    }
});