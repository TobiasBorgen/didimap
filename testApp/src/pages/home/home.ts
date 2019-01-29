import { Component } from '@angular/core';
import { NavController } from 'ionic-angular';
import * as Tesseract from 'tesseract.js'
import {Camera, PictureSourceType} from '@ionic-native/camera';
import { ActionSheetController } from 'ionic-angular';
import { HTTP } from '@ionic-native/http';
import { PopoverController } from 'ionic-angular';
import { MyPopOverPage } from './my-pop-over';


@Component({
  selector: 'page-home',
  templateUrl: 'home.html'
})
export class HomePage {

  selectedImage: string;
  imageText: string;
  ingredientInfo: string;
  info = [];

  constructor(public navCtrl: NavController, private camera: Camera, private actionSheetCtrl: ActionSheetController, private http: HTTP, public popoverCtrl: PopoverController) {
  }

  presentPopover() {
    const popover = this.popoverCtrl.create(MyPopOverPage, this.ingredientInfo);
    popover.present();
  }

  selectSource() {
    let actionSheet = this.actionSheetCtrl.create({
      buttons: [
        {
          text: 'Use Library',
          handler: () => {
            this.getPicture(this.camera.PictureSourceType.PHOTOLIBRARY);
          }
        }, {
          text: 'Capture Image',
          handler: () => {
            this.getPicture(this.camera.PictureSourceType.CAMERA);
          }
        }, {
          text: 'Cancel',
          role: 'cancel'
        }
      ]
    });
    actionSheet.present();
  }

  getPicture(sourceType: PictureSourceType) {
    this.camera.getPicture({
      quality: 100,
      destinationType: this.camera.DestinationType.DATA_URL,
      sourceType: sourceType,
      allowEdit: true,
      saveToPhotoAlbum: false,
      correctOrientation: true
    }).then((imageData) => {
      this.selectedImage = `data:image/jpeg;base64,${imageData}`;
    });
  }

  recognizeImage() {
    Tesseract.recognize(this.selectedImage,{lang: 'nor'})
    .catch(err => console.error(err))
    .then(result => {
      this.imageText = result.text;
    });
  }

  checkIngredients() {
    let body = {
      imageText: this.imageText
    }


    this.http.post('http://localhost:3000/api/v1/check_fodmaps/checkingredients', body, {})
      .then(data => {
        console.log(data.status);
        console.log(data.data);
        console.log(data.headers);
        let tmp = JSON.parse(data.data);
        //this.ingredientInfo = tmp.ingredients.oligo_value;
        //JSON.stringify(this.ingredientInfo);

        console.log("before");
        console.log(tmp[0].food);
        //console.log(tmp.ingredients.food);
        console.log("after");

        this.ingredientInfo = tmp[0].food;
        for (let entry of tmp){
          this.info.push(entry.food);
        }

        this.info.toString();

        console.log(this.info);


        //JSON.stringify(this.ingredientInfo);
      });
  }
}
