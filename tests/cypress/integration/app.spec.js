describe('app', () => {
  beforeEach(() => {
    cy.visit('/');
  });

  it('starts', () => {});

  it('has correct table columns', () => {
    /* Basic table structure */
    cy
      .get('#app-data > table > thead > tr > th:nth-child(1)')
      .should('have.text', '  ');

    cy
      .get('#app-data > table > thead > tr > th:nth-child(2)')
      .should('have.text', ' mpg ');
  });

  it('shows notification', () => {
    /* Notification is visible */
    cy
      .get('#shiny-notification-panel')
      .should('be.visible');
  });

  it('has working select input', function() {
    /* Change select to Transmission */
    cy
      .get('select')
      .select('am');

    cy
      .get('#app-data > table > thead > tr > th:nth-child(3)')
      .should('have.text', ' am ');

    /* Change select to Gears */
    cy
      .get('select')
      .select('gear');

    cy
      .get('#app-data > table > thead > tr > th:nth-child(3)')
      .should('have.text', ' gear ');
  });
});
