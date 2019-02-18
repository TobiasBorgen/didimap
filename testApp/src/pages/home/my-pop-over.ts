import {NavParams, ViewController} from "ionic-angular";
import {Component} from "@angular/core";

@Component({
  template: `
    <ion-list>
      <h1>{{food}}</h1>
      <h1 *ngIf="oligo_value=='low'" style="color:green">Oligo: {{oligo_value}}</h1>
      <h1 *ngIf="oligo_value=='moderate'" style="color:orange">Oligo: {{oligo_value}}</h1>
      <h1 *ngIf="oligo_value=='high'" style="color:red">Oligo: {{oligo_value}}</h1>
      <h1 *ngIf="oligo_value=='unknown'" style="color:black">Oligo: {{oligo_value}}</h1>
      <h1 *ngIf="fructose_value=='low'" style="color:green">Fructose: {{fructose_value}}</h1>
      <h1 *ngIf="fructose_value=='moderate'" style="color:orange">Fructose: {{fructose_value}}</h1>
      <h1 *ngIf="fructose_value=='high'" style="color:red">Fructose: {{fructose_value}}</h1>
      <h1 *ngIf="fructose_value=='unknown'" style="color:black">Fructose: {{fructose_value}}</h1>
      <h1 *ngIf="polyol_value=='low'" style="color:green">Polyol: {{polyol_value}}</h1>
      <h1 *ngIf="polyol_value=='moderate'" style="color:orange">Polyol: {{polyol_value}}</h1>
      <h1 *ngIf="polyol_value=='high'" style="color:red">Polyol: {{polyol_value}}</h1>
      <h1 *ngIf="polyol_value=='unknown'" style="color:black">Polyol: {{polyol_value}}</h1>
      <h1 *ngIf="lactose_value=='low'" style="color:green">Lactose: {{lactose_value}}</h1>
      <h1 *ngIf="lactose_value=='moderate'" style="color:orange">Lactose: {{lactose_value}}</h1>
      <h1 *ngIf="lactose_value=='high'" style="color:red">Lactose: {{lactose_value}}</h1>
      <h1 *ngIf="lactose_value=='unknown'" style="color:black">Lactose: {{lactose_value}}</h1>
      <h1 *ngIf="users_with_symptoms>=0" style="color:red">Users with symptoms: {{users_with_symptoms}}</h1>
      <h1 *ngIf="users_without_symptoms>=0" style="color:green">users_without_symptoms: {{users_without_symptoms}}</h1>
      <h1 *ngIf="users_with_symptoms>=0" style="color:green">% Without symptoms: {{users_without_symptoms/(users_with_symptoms+users_without_symptoms)}}</h1>
      <h1>{{desc}}</h1>
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
  users_with_symptoms: number;
  users_without_symptoms: number;

  constructor(public viewCtrl: ViewController, public navParams:NavParams) {
    console.log(this.navParams.data);
    this.food = this.navParams.get('key1').food;
    this.oligo_value = this.navParams.get('key1').oligo_value;
    this.fructose_value = this.navParams.get('key1').fruktose_value;
    this.polyol_value = this.navParams.get('key1').polyol_value;
    this.lactose_value = this.navParams.get('key1').laktose_value;
    this.desc = this.navParams.get('key1').desc;
    this.users_with_symptoms=this.navParams.get('key1').users_with_symptoms;
    this.users_without_symptoms=this.navParams.get('key1').users_without_symptoms;

  }

  close() {
    this.viewCtrl.dismiss();
  }
}
