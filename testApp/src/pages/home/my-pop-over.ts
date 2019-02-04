import {NavParams, ViewController} from "ionic-angular";
import {Component} from "@angular/core";

@Component({
  template: `
    <ion-list>
      <h1>{{food}}</h1>
      <h1 *ngIf="oligo_value=='low'" style="color:green">Oligo: {{oligo_value}}</h1>
      <h1 *ngIf="oligo_value=='moderate'" style="color:orange">Oligo: {{oligo_value}}</h1>
      <h1 *ngIf="oligo_value=='high'" style="color:red">Oligo: {{oligo_value}}</h1>
      <h1 *ngIf="fructose_value=='low'" style="color:green">Fructose: {{fructose_value}}</h1>
      <h1 *ngIf="fructose_value=='moderate'" style="color:orange">Fructose: {{fructose_value}}</h1>
      <h1 *ngIf="fructose_value=='high'" style="color:red">Fructose: {{fructose_value}}</h1>
      <h1 *ngIf="polyol_value=='low'" style="color:green">Polyol: {{polyol_value}}</h1>
      <h1 *ngIf="polyol_value=='moderate'" style="color:orange">Polyol: {{polyol_value}}</h1>
      <h1 *ngIf="polyol_value=='high'" style="color:red">Polyol: {{polyol_value}}</h1>
      <h1 *ngIf="lactose_value=='low'" style="color:green">Lactose: {{lactose_value}}</h1>
      <h1 *ngIf="lactose_value=='moderate'" style="color:orange">Lactose: {{lactose_value}}</h1>
      <h1 *ngIf="lactose_value=='high'" style="color:red">Lactose: {{lactose_value}}</h1>
      <h1>{{desc}}</h1>

      <!--<button ion-item (click)="close()">GitHub Repo</button> -->
    </ion-list>
  `
})



export class MyPopOverPage {
  food: string;
  oligo_value: string;
  fructose_value: string;
  polyol_value: string;
  lactose_value: string;
  desc: string;

  constructor(public viewCtrl: ViewController, public navParams:NavParams) {
    console.log(this.navParams.data);
    this.food = this.navParams.get('key1').food;
    this.oligo_value = this.navParams.get('key1').oligo_value;
    this.fructose_value = this.navParams.get('key1').fruktose_value;
    this.polyol_value = this.navParams.get('key1').polyol_value;
    this.lactose_value = this.navParams.get('key1').laktose_value;
    this.desc = this.navParams.get('key1').desc;

  }

  close() {
    this.viewCtrl.dismiss();
  }
}
