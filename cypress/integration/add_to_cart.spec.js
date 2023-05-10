<reference types="cypress" />
import React from 'react';

describe('Product details', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it('can click the add to cart button and add the item to the cart', () => {
    cy.get('form[action="/cart/add_item?product_id=2"] button.btn')
      .click({ force: true })
    cy.get('li.nav-item.end-0 a.nav-link')
      .should('include.text', '(1)')
  })
})
