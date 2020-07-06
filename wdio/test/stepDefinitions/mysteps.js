import {Given, When, Then} from 'cucumber';
import homePage from '../pageobjects/sfhomePage.page'
const scratchInfo = require('../../../result.json')

When(/^I open the scratch org and login$/, function () {
    var instanceUrl = scratchInfo.result.instanceUrl.replace(/"/g, "");
    var accessToken = scratchInfo.result.accessToken.replace(/"/g, "");
    var url = instanceUrl + "/secur/frontdoor.jsp?sid=" + accessToken + "&retURL=" + instanceUrl
    console.log("Logging into: ", url);
    browser.url(url);
});

Then(/^I am successfully authenticated on SF$/, function () {
    homePage.waitForHomePageToLoad()
});