function price () {
  let amount = document.getElementById('item-price')
  let commission = document.getElementById('add-tax-price')
  let total = document.getElementById('profit')
    amount.addEventListener("input",  (e) => {
      e.preventDefault()
        let subtotal = amount.value
        commission.innerHTML = Math.floor(subtotal * 0.1)
        // total.innerHTML = Math.floor(subtotal * 0.9)
        total.innerHTML = Math.floor(subtotal - Math.floor(subtotal * 0.1))
    })
}

window.addEventListener('turbo:load', price)
window.addEventListener('turbo:render', price)