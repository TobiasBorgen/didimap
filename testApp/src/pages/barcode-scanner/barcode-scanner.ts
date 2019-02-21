import { Component } from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';
import { BarcodeScanner } from '@ionic-native/barcode-scanner/ngx';
import { HTTP } from '@ionic-native/http';

/**
 * Generated class for the BarcodeScannerPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-barcode-scanner',
  templateUrl: 'barcode-scanner.html',
})
export class BarcodeScannerPage {

  constructor(public navCtrl: NavController, private http: HTTP, public navParams: NavParams, private barcodeScanner: BarcodeScanner) {
  }

  scanBarcode() {
    this.barcodeScanner.scan().then(barcodeData => {
      console.log('Barcode data', barcodeData);
      this.http.get('http://localhost:3000/api/v1/scan_barcode', barcodeData.text, {})
        .then(data => { })
        .catch(error => { });

    }).catch(err => {
      console.log('Error', err);
    });
  }
  
  ionViewDidLoad() {
    console.log('ionViewDidLoad BarcodeScannerPage');
  }

}
