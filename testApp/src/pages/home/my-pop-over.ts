import {ViewController} from "ionic-angular";
import {Component} from "@angular/core";

@Component({
  template: `
    <ion-list>
      <ion-list-header>Ionic</ion-list-header>
      <h1 style="color:red">The quick brown fox jumps over the lazy dog</h1>
      <ion-icon name="restaurant"></ion-icon>
      <button ion-item (click)="close()">Showcase</button>
      <button ion-item (click)="close()">GitHub Repo</button>
    </ion-list>
  `
})

export class MyPopOverPage {
  constructor(public viewCtrl: ViewController) {}

  close() {
    this.viewCtrl.dismiss();
  }
}
