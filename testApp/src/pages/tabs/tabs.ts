import { Component } from '@angular/core';

import { AboutPage } from '../about/about';
import { ContactPage } from '../contact/contact';
import { HomePage } from '../home/home';
import { MealLogPage } from "../meal-log/meal-log";
import { BarcodeScannerPage } from "../barcode-scanner/barcode-scanner";

@Component({
  templateUrl: 'tabs.html'
})
export class TabsPage {

  tab1Root = HomePage;
  tab2Root = AboutPage;
  tab3Root = ContactPage;
  tab4Root = MealLogPage;
  tab5Root = BarcodeScannerPage;

  constructor() {

  }
}
