import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["quantity", "unitPriceSelect", "subtotal", "freight", "total"]
  static values = {
    unitPrice: Number,
    freightPerUnit: { type: Number, default: 12.50 }
  }

  connect() {
    this.updatePriceFromSelect()
    this.calculate()
  }

  updatePriceFromSelect() {
    if (this.hasUnitPriceSelectTarget) {
      const selected = this.unitPriceSelectTarget.selectedOptions[0]
      if (selected && selected.dataset.price) {
        this.unitPriceValue = parseFloat(selected.dataset.price)
      }
    }
  }

  productChanged() {
    this.updatePriceFromSelect()
    this.calculate()
  }

  calculate() {
    const qty = Math.max(1, parseInt(this.quantityTarget.value, 10) || 1)
    const unitPrice = this.unitPriceValue || 0
    const freightRate = this.freightPerUnitValue || 12.50

    const subtotal = qty * unitPrice
    const freight = qty * freightRate
    const total = subtotal + freight

    const formatBRL = (val) => {
      return new Intl.NumberFormat("pt-BR", { style: "currency", currency: "BRL" }).format(val)
    }

    if (this.hasSubtotalTarget) {
      this.subtotalTarget.textContent = formatBRL(subtotal)
    }
    if (this.hasFreightTarget) {
      this.freightTarget.textContent = formatBRL(freight)
    }
    if (this.hasTotalTarget) {
      this.totalTarget.textContent = formatBRL(total)
    }
  }
}
