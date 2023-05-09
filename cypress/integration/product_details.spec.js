<reference types="cypress" />
import React from 'react';

describe('Product details', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it('can navigate from home page to product detail page', () => {
    cy.wait(1000);
    cy.get('a[href="/products/2"]')
    .click()
    cy.url().should('include', '/products/')
  })
})