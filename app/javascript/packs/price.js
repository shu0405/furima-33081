const { clearCache } = require("turbolinks");

window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const addTaxDom = document.getElementById("add-tax-price");
  const inputValue = priceInput.value;
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1) /1;
    const profitPrice = document.getElementById("profit");
     profitPrice.innerHTML = Math.floor(inputValue - (Math.floor(inputValue * 0.1) /1)) ;
})
})



