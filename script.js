document.addEventListener('DOMContentLoaded', () => {
    const donationCards = document.querySelectorAll('.donation-card');
    const cart = document.getElementById('cart');
    let itemsInCart = [];

    donationCards.forEach((card, index) => {
        card.addEventListener('click', () => {
            const item = {
                id: index + 1,
                name: card.querySelector('h2').innerText,
                price: parseFloat(card.querySelector('p').innerText.replace('$', '')),
            };

            const existingItemIndex = itemsInCart.findIndex(i => i.id === item.id);
            if (existingItemIndex !== -1) {
                itemsInCart[existingItemIndex].quantity++;
            } else {
                item.quantity = 1;
                itemsInCart.push(item);
            }

            updateCart();
        });
    });

    function updateCart() {
        cart.innerHTML = '';
        let total = 0;

        itemsInCart.forEach(item => {
            const cartItem = document.createElement('div');
            cartItem.classList.add
        }
        )
    }
}
)


function alertmsg() {
    alert("message successfully sent").then(response => {
    window.location.href = 'contact.html';
})
}