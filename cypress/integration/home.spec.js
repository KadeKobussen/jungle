<reference types="cypress" />
import React from 'react';

describe('Visit home page', () => {
  it('Visits the home page of Jungle App', () => {
    cy.visit('http://localhost:3000')
  })

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 12 products on the page", () => {
    cy.get(".products article").should("have.length", 12);
  });
})
