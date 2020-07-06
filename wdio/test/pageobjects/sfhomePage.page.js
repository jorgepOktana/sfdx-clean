import Page from './page';

class HomePage extends Page {

    /**
    * define elements
    */
    get sfLogo() { return $('.slds-global-header__logo')}
    // get usernameInput()   { return $('div.form-group:nth-child(1) > input:nth-child(3)'); }
    // get passwordInput()   { return $('.panel-body > div:nth-child(2) > input:nth-child(3)'); }
    // get loginButton()     { return $('//button[contains(., "Login")]'); }
    // get headerImage()     { return $('//img[@alt=\"Login\"]'); }

    /**
     * your page specific methods
     */

    waitForHomePageToLoad () {
      if(!this.sfLogo.isDisplayed()){
        this.sfLogo.waitForDisplayed(10000);
      }
    }
}

export default new HomePage()
