import {Component, ViewChild} from '@angular/core';
import { IonicPage, NavController, NavParams } from 'ionic-angular';
import { Storage } from '@ionic/storage';

/**
 * Generated class for the MealLogPage page.
 *
 * See https://ionicframework.com/docs/components/#navigation for more info on
 * Ionic pages and navigation.
 */

@IonicPage()
@Component({
  selector: 'page-meal-log',
  templateUrl: 'meal-log.html',
})
export class MealLogPage {
  @ViewChild("newMeal") newMeal;
  singleValue0: number = 0;
  singleValue1: number = 0;
  singleValue2: number = 0;
  singleValue3: number = 0;
  singleValue4: number = 0;


  constructor(public navCtrl: NavController, public navParams: NavParams, private storage: Storage) {
  }

  ionViewDidLoad() {
    console.log('ionViewDidLoad MealLogPage');
  }

  addMeal(meal) {
    console.log("Adding meal");
    console.log(meal.value);
    console.log("Overall: " + this.singleValue0 + ", Pain/Discomfort: " + this.singleValue1 + ", Bloating: " + this.singleValue2 + ", Tiredness: " + this.singleValue3 + ", Nausea: " + this.singleValue4);
    var value = "Overall: " + this.singleValue0 + ", Pain/Discomfort: " + this.singleValue1 + ", Bloating: " + this.singleValue2 + ", Tiredness: " + this.singleValue3 + ", Nausea: " + this.singleValue4;

    this.singleValue0 = 0;
    this.singleValue1 = 0;
    this.singleValue2 = 0;
    this.singleValue3 = 0;
    this.singleValue4 = 0;
    this.newMeal = "";

    //this.storage.set(meal.value, value);
  }

}
