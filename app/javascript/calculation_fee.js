function calculation_fee (){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("input", () => {
    const addTaxPrice = document.getElementById("add-tax-price");
    const Profit = document.getElementById("profit");
    addTaxPrice.innerHTML = Math.floor(itemPrice.value/10).toLocaleString();
    Profit.innerHTML = (itemPrice.value - Math.floor(itemPrice.value/10)).toLocaleString();

  });

};
window.addEventListener('turbo:load', calculation_fee);